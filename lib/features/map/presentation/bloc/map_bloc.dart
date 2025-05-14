import 'package:bloc/bloc.dart';
import 'package:car_booking/features/map/domain/usecase/get_location_suggestions_usecase.dart';
import 'package:car_booking/features/map/domain/usecase/get_place_details_usecase.dart';
import 'package:car_booking/features/map/domain/usecase/submit_location_usecase.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:car_booking/features/map/domain/entities/location_entity.dart';
import 'package:car_booking/features/map/domain/usecase/get_location_history_usecase.dart';
import 'package:car_booking/features/map/domain/usecase/get_current_location_usecase.dart';
import 'package:car_booking/features/map/presentation/widgets/info_windows_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_bloc.freezed.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({
    required this.getCurrentLocationUsecase,
    required this.getLocationHistoryUseCase,
    required this.submitLocationUsecase,
    required this.getLocationSuggestionsUsecase,
    required this.getPlaceDetailsUsecase,
  }) : super(const MapState()) {
    _initializeMarkerIcon();
    on(_onInit);
    on(_onSelectLocation);
    on(_onSubmitLocation);
    on(_onSearchLocation);
  }

  final GetLocationUsecase getCurrentLocationUsecase;
  final GetLocationHistoryUseCase getLocationHistoryUseCase;
  final SubmitLocationUsecase submitLocationUsecase;
  final GetLocationSuggestionsUsecase getLocationSuggestionsUsecase;
  final GetPlaceDetailsUsecase getPlaceDetailsUsecase;
  late BitmapDescriptor markerIcon;

  static const _defaultZoom = 20.0;

  Future<void> _initializeMarkerIcon() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(56.0, 56.0)),
      Assets.icons.bitmapIc.path,
    );
  }

  Marker _createMarker(double latitude, double longitude) {
    return Marker(
      markerId: const MarkerId('current_location'),
      position: LatLng(latitude, longitude),
      icon: markerIcon,
    );
  }

  Future<void> _onInit(InitialEvent event, Emitter<MapState> emit) async {
    try {
      // Lấy vị trí hiện tại
      final locationMap = await getCurrentLocationUsecase();
      final latitude = locationMap['latitude'] as double?;
      final longitude = locationMap['longitude'] as double?;

      if (latitude == null ||
          longitude == null ||
          latitude == 0.0 ||
          longitude == 0.0) {
        // emit(state.copyWith(error: 'Dữ liệu vị trí không hợp lệ'));
        return;
      }

      // Lấy địa chỉ từ tọa độ
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      final placemark = placemarks.isNotEmpty ? placemarks.first : null;

      final placeName =
          placemark?.name ?? placemark?.locality ?? 'Vị trí không xác định';
      final address =
          placemark != null
              ? [
                placemark.street,
                placemark.subLocality,
                placemark.locality,
                placemark.administrativeArea,
                placemark.country,
              ].where((e) => e != null && e.isNotEmpty).join(", ")
              : 'Địa chỉ không xác định';

      // Tạo LocationEntities
      final currentLocation = LocationEntities(
        latitude: latitude,
        longitude: longitude,
        title: placeName,
        address: address,
      );

      // Tạo marker
      final markers = {_createMarker(latitude, longitude)};

      // Tạo info window
      final infoWindow = InfoWindowsWidget(
        title: placeName,
        snippet: address,
        borderRadius: 99,
      );

      // Cập nhật vị trí camera
      final cameraPosition = CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: _defaultZoom,
      );

      // Lấy lịch sử vị trí
      final histories = await getLocationHistoryUseCase();
      final updatedHistories = [
        currentLocation,
        ...histories.where(
          (h) => h.latitude != latitude || h.longitude != longitude,
        ),
      ];

      // Cập nhật trạng thái
      emit(
        state.copyWith(
          currentLocation: currentLocation,
          locationHistories: updatedHistories,
          markers: markers,
          infoWindow: infoWindow,
          infoWindowPosition: LatLng(latitude, longitude),
          cameraPosition: cameraPosition,
          // error: null,
        ),
      );
    } catch (e) {
      // emit(state.copyWith(error: 'Không thể khởi tạo bản đồ: $e'));
    }
  }

  Future<void> _onSelectLocation(
    SelectLocationEvent event,
    Emitter<MapState> emit,
  ) async {
    final location = event.location;
    if (location.latitude == null || location.longitude == null) {
      // emit(state.copyWith(error: 'Vị trí được chọn không hợp lệ'));
      return;
    }

    final markers = {_createMarker(location.latitude!, location.longitude!)};

    final infoWindow = InfoWindowsWidget(
      title: location.title ?? 'Vị trí không xác định',
      snippet: location.address ?? 'Địa chỉ không xác định',
      borderRadius: 99,
    );

    final cameraPosition = CameraPosition(
      target: LatLng(location.latitude!, location.longitude!),
      zoom: _defaultZoom,
    );

    emit(
      state.copyWith(
        currentLocation: location,
        markers: markers,
        infoWindow: infoWindow,
        infoWindowPosition: LatLng(location.latitude!, location.longitude!),
        cameraPosition: cameraPosition,
        // error: null,
      ),
    );
  }

  Future<void> _onSubmitLocation(
    SubmitLocationEvent event,
    Emitter<MapState> emit,
  ) async {
    try {
      await submitLocationUsecase(event.location);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onSearchLocation(
    SearchLocationEvent event,
    Emitter<MapState> emit,
  ) async {}
}
