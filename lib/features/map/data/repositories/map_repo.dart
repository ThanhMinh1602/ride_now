import 'package:car_booking/features/map/data/datasources/map_data_sources.dart';
import 'package:car_booking/features/map/domain/entities/location_entity.dart';
import 'package:car_booking/features/map/domain/repositories/i_map_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IMapRepo)
class MapRepo implements IMapRepo {
  final MapDataSources mapDataSources;

  MapRepo(this.mapDataSources);

  @override
  Future<Either<String, List<LocationEntities>>> getHistoryLocation() async {
    try {
      final result = await mapDataSources.getLocationHistory();

      return result.fold(
        (error) => Left(error),
        (locationModels) =>
            Right(locationModels.map((model) => model.toEntity()).toList()),
      );
    } catch (e) {
      return Left('Repository error: $e');
    }
  }

  @override
  Future<Either<String, List<LocationEntities>>> getLocationSuggestions(
    String input,
  ) async {
    final result = await mapDataSources.getLocationSuggestions(input);

    return result.fold(
      (l) => Left(l),
      (locationModels) =>
          Right(locationModels.map((model) => model.toEntity()).toList()),
    );
  }

  @override
  Future<Either<String, LocationEntities>> getPlaceDetails(
    String placeId,
  ) async {
    final result = await mapDataSources.getPlaceDetails(placeId);

    return result.fold(
      (l) => Left(l),
      (locationModel) => Right(locationModel.toEntity()),
    );
  }
}
