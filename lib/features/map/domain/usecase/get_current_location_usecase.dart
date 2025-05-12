import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

//get ra location hiện tại
@Singleton()
class GetLocationUsecase {
  Future<Map<String, dynamic>> call() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        throw Exception('Quyền truy cập vị trí bị từ chối!');
      }

      if (permission == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
        throw Exception('Quyền truy cập vị trí bị từ chối vĩnh viễn!');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return {'latitude': position.latitude, 'longitude': position.longitude};
    } catch (e) {
      print('Lỗi khi lấy vị trí: ${e.toString()}');
      throw Exception('Lỗi khi lấy vị trí!');
    }
  }
}
