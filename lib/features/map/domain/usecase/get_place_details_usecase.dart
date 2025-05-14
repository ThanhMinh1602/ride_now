import 'package:car_booking/features/map/domain/entities/location_entity.dart';
import 'package:car_booking/features/map/domain/repositories/i_map_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GetPlaceDetailsUsecase {
  final IMapRepo mapRepo;

  GetPlaceDetailsUsecase(this.mapRepo);

  Future<LocationEntities> call(String planceId) async {
    final result = await mapRepo.getPlaceDetails(planceId);
    if (result.isLeft) {
      throw Exception('Lỗi khi lấy get Location Suggestions');
    }
    return result.right;
  }
}
