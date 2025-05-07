import 'package:car_booking/features/map/data/models/location_model.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class MapDataSources {
  Future<Either<String, List<LocationModel>>> getLocationHistory() async {
    try {
      // Trả về dữ liệu giả (fake data)
      final List<LocationModel> locationHistories = [
        LocationModel(
          latitude: 15.844301749112311,
          longitude: 108.31028521219115,
          title: 'Bình Minh Tâm Thức',
          address:
              'R8V6+P47, Đội 7, thôn Triều Châu, Duy Xuyên, Quảng Nam, Vietnam',
        ),
        LocationModel(
          latitude: 16.061884420200823,
          longitude: 108.15919910769438,
          title:
              'University of Science and Education - The University of Danang',
          address:
              '459 Tôn Đức Thắng, Hoà Khánh Nam, Liên Chiểu, Đà Nẵng 550000, Vietnam',
        ),
        LocationModel(
          latitude: 16.04306888759104,
          longitude: 108.17681985644523,
          title: 'Hi-Dragons - English center',
          address:
              'Lô 22-23 B1.17 Khu TĐCPhước Lý, 2, Đinh Liệt, Hoà An, Cẩm Lệ, Đà Nẵng 550000, Vietnam',
        ),
        LocationModel(
          latitude: 16.07399044031935,
          longitude: 108.14987974704654,
          title: 'Da Nang University of Science and Technology',
          address:
              '54 Nguyễn Lương Bằng, Hoà Khánh Bắc, Liên Chiểu, Đà Nẵng 550000, Vietnam',
        ),
        LocationModel(
          latitude: 16.0601580816905,
          longitude: 108.20977438932243,
          title: 'Duy Tan University',
          address:
              '254 Đ. Nguyễn Văn Linh, Thạc Gián, Thanh Khê, Đà Nẵng 550000, Vietnam',
        ),
      ];

      return Right(locationHistories); // Trả về dữ liệu thành công
    } catch (e) {
      print(e);
      return Left('Failed to fetch location history: $e'); // Trả về lỗi
    }
  }
}
