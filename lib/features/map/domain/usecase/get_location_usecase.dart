import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:car_booking/features/map/domain/entities/location_entity.dart';

//get ra location hiện tại
class GetLocationUsecase {
  Future<Either<String, LocationEntity>> call() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        return const Left('Quyền truy cập vị trí bị từ chối!');
      }

      if (permission == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
        return const Left('Quyền truy cập vị trí bị từ chối vĩnh viễn!');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return Right(
        LocationEntity(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    } catch (e) {
      print('Lỗi khi lấy vị trí: ${e.toString()}');
      return Left('Lỗi khi lấy vị trí!');
    }
  }
}
