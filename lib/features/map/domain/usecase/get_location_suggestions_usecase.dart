import 'package:car_booking/features/map/domain/entities/location_entity.dart';
import 'package:car_booking/features/map/domain/repositories/i_map_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GetLocationSuggestionsUsecase {
  final IMapRepo mapRepo;

  GetLocationSuggestionsUsecase(this.mapRepo);

  Future<List<LocationEntities>> call(String input) async {
    final result = await mapRepo.getLocationSuggestions(input);
    if (result.isLeft) {
      throw Exception('Lỗi khi lấy get Location Suggestions');
    }
    return result.right;
  }
}
