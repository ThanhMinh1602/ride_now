part of 'map_bloc.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    LocationEntities? currentLocation,
    @Default([]) List<LocationEntities> locationHistories,
    @Default({}) Set<Marker> markers,
    Widget? infoWindow,
    LatLng? infoWindowPosition,
    CameraPosition? cameraPosition,
  }) = _MapState;
}
