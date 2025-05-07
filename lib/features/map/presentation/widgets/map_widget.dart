import 'dart:async';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_shadows.dart';
import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/features/map/presentation/bloc/map_bloc.dart';
import 'package:car_booking/features/map/presentation/widgets/info_windows_widget.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarker();
    // Đảm bảo InfoWindow được hiển thị ngay khi khởi tạo
    _showDefaultInfoWindow();
  }

  void _addMarker() {
    _markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: const LatLng(16.0430185, 108.1767579),
        icon: AssetMapBitmap(
          Assets.icons.bitmapIc.path,
          width: 56.0,
          height: 56.0,
        ),
        onTap: () {},
      ),
    );
  }

  void _showDefaultInfoWindow() {
    // Đợi controller sẵn sàng để thêm InfoWindow
    _controller.future.then((controller) {
      customInfoWindowController.googleMapController = controller;
      // Thêm InfoWindow mặc định
      customInfoWindowController.addInfoWindow!(
        InfoWindowsWidget(
          title: 'Hi-Dragon Center',
          snippet: 'Lô 22-23 B1.17 Khu TĐkjanfasbfhsafjksa',
          borderRadius: 99,
        ),
        const LatLng(16.0430185, 108.1767579),
      );
    });
  }

  @override
  void dispose() {
    customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        height: context.screenHeight * 335 / 824,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        decoration: BoxDecoration(
          color: AppColor.surfaceWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          boxShadow: [AppShadows.medium],
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [Text('dá')]),
      ),
      body: Stack(
        children: [
          BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    state.locationEntities?.latitude ?? 16.0430185,
                    state.locationEntities?.longitude ?? 108.1767579,
                  ),
                  zoom: 17.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  customInfoWindowController.googleMapController = controller;
                },
                markers: _markers,
                onCameraMove: (position) {
                  customInfoWindowController.onCameraMove!();
                },
              );
            },
          ),
          CustomInfoWindow(
            controller: customInfoWindowController,
            width: 155,
            height: 56.0,
            offset: 58.0,
          ),
        ],
      ),
    );
  }
}
