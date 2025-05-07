import 'package:car_booking/features/map/domain/entities/location_entity.dart';
import 'package:car_booking/features/map/domain/repositories/i_map_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GetLocationHistoryUseCase {
  final IMapRepo mapRepo;

  GetLocationHistoryUseCase({required this.mapRepo});

  Future<List<LocationEntities>> call() async {
    final result = await mapRepo.getHistoryLocation();
    if (result.isLeft) {
      throw Exception(result.left);
    }
    return result.right;
  }
}
