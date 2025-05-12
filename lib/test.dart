import 'dart:async';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Hàm main để khởi chạy ứng dụng
void main() {
  runApp(const UngDung());
}

// Ứng dụng Flutter chính
class UngDung extends StatelessWidget {
  const UngDung({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bản Đồ Google Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ManHinhBanDo(),
    );
  }
}

// Màn hình hiển thị bản đồ
class ManHinhBanDo extends StatefulWidget {
  const ManHinhBanDo({super.key});

  @override
  State<ManHinhBanDo> createState() => _TrangThaiManHinhBanDo();
}

class _TrangThaiManHinhBanDo extends State<ManHinhBanDo> {
  // Bộ điều khiển để thao tác với bản đồ Google
  final Completer<GoogleMapController> _boDieuKhien = Completer();

  // Tập hợp các điểm đánh dấu (marker)
  final Set<Marker> _danhSachDiemDanhDau = {
    Marker(
      markerId: const MarkerId('diem_danh_dau_1'),
      position: const LatLng(16.0430185, 108.1767579),

      infoWindow: const InfoWindow(
        title: 'Điểm Đánh Dấu Mẫu',
        snippet: 'Đà Nẵng',
      ),
    ),
  };

  // Tập hợp các đa giác (polygon)
  // final Set<Polygon> _danhSachDaGiac = {
  //   Polygon(
  //     polygonId: const PolygonId('khu_vuc_1'),
  //     points: const [
  //       LatLng(16.04, 108.17),
  //       LatLng(16.05, 108.17),
  //       LatLng(16.05, 108.18),
  //       LatLng(16.04, 108.18),
  //     ],
  //     fillColor: Colors.red.withOpacity(0.3),
  //     strokeColor: Colors.red,
  //     strokeWidth: 2,
  //   ),
  // };

  // Tập hợp các đường nối (polyline)
  // final Set<Polyline> _danhSachDuongNoi = {
  //   Polyline(
  //     polylineId: const PolylineId('tuyen_duong_1'),
  //     points: const [LatLng(16.043, 108.176), LatLng(16.053, 108.186)],
  //     color: Colors.yellow,
  //     width: 5,
  //   ),
  // };

  // Tập hợp các hình tròn (circle)
  final Set<Circle> _danhSachHinhTron = {
    Circle(
      circleId: const CircleId('hinh_tron_1'),
      center: const LatLng(16.0430185, 108.1767579),
      radius: 20, // 1km
      fillColor: AppColor.primary.withOpacity(0.4),
      strokeWidth: 0,
    ),
  };

  // Tập hợp các lớp phủ bản đồ tùy chỉnh (tile overlay)
  final Set<TileOverlay> _danhSachLopPhu = {};

  // Tập hợp các hình ảnh phủ lên bản đồ (ground overlay)
  final Set<GroundOverlay> _danhSachHinhAnhPhu = {};

  // Chuỗi JSON định dạng giao diện bản đồ tùy chỉnh

  // final String _kieuBanDo = '''[
  //   {
  //     "featureType": "water",
  //     "elementType": "geometry",
  //     "stylers": [
  //       { "color": "#193341" }
  //     ]
  //   },
  //   {
  //     "featureType": "road",
  //     "elementType": "geometry",
  //     "stylers": [
  //       { "color": "#4a4a4a" }
  //     ]
  //   }
  // ]''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bản Đồ Google Demo')),
      body: GoogleMap(
        // Khóa để quản lý widget trong cây widget
        key: const ValueKey('ban_do_google'),

        // Vị trí ban đầu của camera, đặt tại Đà Nẵng, Việt Nam
        initialCameraPosition: const CameraPosition(
          target: LatLng(16.0430185, 108.1767579),
          zoom: 17.4746,
        ),
        // Áp dụng giao diện bản đồ tùy chỉnh
        // style: _kieuBanDo,

        // Hàm gọi khi bản đồ được tạo, lưu bộ điều khiển
        onMapCreated: (GoogleMapController boDieuKhien) {
          _boDieuKhien.complete(boDieuKhien);
        },

        // Xử lý các cử chỉ tùy chỉnh (cho phép bản đồ nhận tất cả cử chỉ)
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(EagerGestureRecognizer.new),
        },

        // Xử lý cử chỉ trên web (chỉ áp dụng cho Flutter Web)
        webGestureHandling: WebGestureHandling.cooperative,

        // Hiển thị la bàn khi xoay bản đồ
        compassEnabled: false,

        // Hiển thị thanh công cụ khi tương tác với điểm đánh dấu
        mapToolbarEnabled: false,

        // Giới hạn vùng camera (trong khu vực Đà Nẵng)
        cameraTargetBounds: CameraTargetBounds(
          LatLngBounds(
            southwest: const LatLng(16.0, 108.1),
            northeast: const LatLng(16.1, 108.2),
          ),
        ),

        // Loại bản đồ (bình thường, vệ tinh, địa hình, lai)
        mapType: MapType.normal,

        // Giới hạn mức thu phóng (từ 10 đến 18)
        minMaxZoomPreference: const MinMaxZoomPreference(10, 18),

        // Cho phép xoay bản đồ bằng cử chỉ
        rotateGesturesEnabled: true,

        // Cho phép vuốt để di chuyển bản đồ
        scrollGesturesEnabled: true,

        // Hiển thị nút thu phóng (chỉ trên Android)
        zoomControlsEnabled: false,

        // Cho phép thu phóng bằng cử chỉ (chụm/ngửa hai ngón)
        zoomGesturesEnabled: true,

        // Chế độ Lite (tắt tương tác, chỉ trên Android)
        liteModeEnabled: false,

        // Cho phép nghiêng bản đồ (hiệu ứng 3D)
        tiltGesturesEnabled: true,

        // Kích hoạt chế độ xem 45 độ (ảnh vệ tinh nghiêng)
        fortyFiveDegreeImageryEnabled: true,

        // Hiển thị chấm vị trí hiện tại
        myLocationEnabled: true,

        // Hiển thị nút "Vị trí của tôi" để di chuyển camera đến vị trí hiện tại
        myLocationButtonEnabled: true,

        // Hướng bố cục (hỗ trợ ngôn ngữ RTL như tiếng Ả Rập)
        layoutDirection: TextDirection.ltr,

        // Đệm xung quanh bản đồ (tránh che khuất bởi AppBar)
        padding: const EdgeInsets.only(top: 60.0),

        // Kích hoạt chế độ xem trong nhà (bản đồ trong nhà)
        indoorViewEnabled: true,

        // Hiển thị thông tin giao thông
        trafficEnabled: true,

        // Hiển thị tòa nhà 3D
        buildingsEnabled: true,

        // Tập hợp các điểm đánh dấu
        markers: _danhSachDiemDanhDau,

        // Tập hợp các đa giác
        // polygons: _danhSachDaGiac,

        // Tập hợp các đường nối
        // polylines: _danhSachDuongNoi,

        // Tập hợp các hình tròn
        circles: _danhSachHinhTron,

        // Tập hợp các trình quản lý nhóm (nhóm các điểm đánh dấu, cần thư viện bổ sung)
        clusterManagers: const <ClusterManager>{},

        // Tập hợp các lớp phủ bản đồ
        tileOverlays: _danhSachLopPhu,

        // Tập hợp các hình ảnh phủ
        groundOverlays: _danhSachHinhAnhPhu,

        // Hàm gọi khi camera bắt đầu di chuyển
        onCameraMoveStarted: () {
          print('Camera bắt đầu di chuyển');
        },

        // Hàm gọi khi camera di chuyển
        onCameraMove: (CameraPosition viTri) {
          print(
            'Camera di chuyển đến: ${viTri.target}, Thu phóng: ${viTri.zoom}',
          );
        },

        // Hàm gọi khi camera dừng di chuyển
        onCameraIdle: () {
          print('Camera dừng di chuyển');
        },

        // Hàm gọi khi chạm vào bản đồ
        onTap: (LatLng diem) {
          print('Chạm tại: $diem');
          setState(() {
            _danhSachDiemDanhDau.add(
              Marker(
                markerId: MarkerId('cham_${diem.latitude}_${diem.longitude}'),
                position: diem,
                infoWindow: InfoWindow(
                  title: 'Vị Trí Chạm',
                  snippet: diem.toString(),
                ),
              ),
            );
          });
        },

        // Hàm gọi khi nhấn giữ trên bản đồ
        onLongPress: (LatLng diem) {
          print('Nhấn giữ tại: $diem');
          setState(() {
            _danhSachHinhTron.add(
              Circle(
                circleId: CircleId(
                  'hinh_tron_${diem.latitude}_${diem.longitude}',
                ),
                center: diem,
                radius: 500,
                fillColor: Colors.red.withOpacity(0.2),
                strokeColor: Colors.red,
                strokeWidth: 2,
              ),
            );
          });
        },

        // ID của bản đồ tùy chỉnh từ Google Cloud (nếu có)
        cloudMapId: null,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Di chuyển camera đến vị trí mới để minh họa
          final boDieuKhien = await _boDieuKhien.future;
          boDieuKhien.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(target: LatLng(16.053, 108.186), zoom: 16),
            ),
          );
        },
        child: const Icon(Icons.move_to_inbox),
      ),
    );
  }
}
