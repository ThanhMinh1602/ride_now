import 'dart:async';
import 'package:car_booking/features/map/presentation/bloc/map_bloc.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  static const _defaultLat = 16.0430185;
  static const _defaultLng = 108.1767579;
  static const _defaultZoom = 17.4746;
  static const _markerSize = 56.0;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final CustomInfoWindowController _infoWindowController =
      CustomInfoWindowController();

  @override
  void dispose() {
    _infoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<MapBloc, MapState>(
          listener: (context, state) async {
            if (state.infoWindow != null && state.infoWindowPosition != null) {
              final controller = await _controller.future;
              _infoWindowController.googleMapController = controller;
              _infoWindowController.addInfoWindow!(
                state.infoWindow!,
                state.infoWindowPosition!,
              );
            }
            if (state.cameraPosition != null) {
              final controller = await _controller.future;
              await controller.animateCamera(
                CameraUpdate.newCameraPosition(state.cameraPosition!),
              );
            }
          },
          builder: (context, state) {
            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition:
                  state.cameraPosition ??
                  CameraPosition(
                    target: const LatLng(_defaultLat, _defaultLng),
                    zoom: _defaultZoom,
                  ),
              onMapCreated: (controller) {
                _controller.complete(controller);
                _infoWindowController.googleMapController = controller;
              },
              markers: state.markers,
              onCameraMove: (_) => _infoWindowController.onCameraMove!(),
            );
          },
        ),
        CustomInfoWindow(
          controller: _infoWindowController,
          width: 155,
          height: _markerSize,
          offset: _markerSize + 2,
        ),
      ],
    );
  }
}
