import 'dart:convert';
import 'package:car_booking/features/map/data/models/location_model.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart'; // Dùng để tạo sessionToken

@Singleton()
class MapDataSources {
  final String _apiKey = 'AIzaSyCBlap-jqb0uC3vp7eBrzJn8iiTKJpxtgM';
  String? _sessionToken;

  MapDataSources() {
    _sessionToken = Uuid().v4(); // Khởi tạo sessionToken
  }

  // Lấy lịch sử vị trí (giả lập)
  Future<Either<String, List<LocationModel>>> getLocationHistory() async {
    try {
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

      return Right(locationHistories);
    } catch (e) {
      return Left('Failed to fetch location history: $e');
    }
  }

  // Lấy gợi ý vị trí từ Google Places Autocomplete API
  Future<Either<String, List<LocationModel>>> getLocationSuggestions(
    String input,
  ) async {
    try {
      if (input.isEmpty) {
        return Right([]);
      }

      final queryParameters = {
        'input': input,
        'language': 'vi',
        'components': 'country:vn',
        'key': _apiKey,
        'sessiontoken': _sessionToken,
      };

      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      ).replace(queryParameters: queryParameters);

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK' || data['status'] == 'ZERO_RESULTS') {
          final suggestions =
              (data['predictions'] as List)
                  .map(
                    (prediction) => LocationModel(
                      latitude: 0.0,
                      longitude: 0.0,
                      title: prediction['description'],
                      address:
                          prediction['structured_formatting']['secondary_text'] ??
                          '',
                      placeId: prediction['place_id'],
                    ),
                  )
                  .toList();
          return Right(suggestions);
        } else {
          return Left('Lỗi API: ${data['status']}');
        }
      } else {
        return Left('Lỗi kết nối: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Lỗi khi lấy gợi ý vị trí: $e');
    }
  }

  // Lấy chi tiết địa điểm từ Google Places Details API
  Future<Either<String, LocationModel>> getPlaceDetails(String placeId) async {
    try {
      final queryParameters = {
        'place_id': placeId,
        'fields': 'name,geometry/location,formatted_address',
        'key': _apiKey,
        'sessiontoken': _sessionToken,
      };

      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json',
      ).replace(queryParameters: queryParameters);

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final result = data['result'];
          final location = LocationModel(
            latitude: result['geometry']['location']['lat'],
            longitude: result['geometry']['location']['lng'],
            title: result['name'],
            address: result['formatted_address'],
            placeId: placeId,
          );
          _sessionToken =
              Uuid().v4(); // Tạo sessionToken mới sau khi hoàn thành
          return Right(location);
        } else {
          return Left('Lỗi API: ${data['status']}');
        }
      } else {
        return Left('Lỗi kết nối: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Lỗi khi lấy chi tiết địa điểm: $e');
    }
  }
}
