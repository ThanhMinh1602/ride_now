import 'package:car_booking/features/map/domain/entities/location_entity.dart';
import 'package:either_dart/either.dart';

abstract class IMapRepo {
  Future<Either<String, List<LocationEntities>>> getHistoryLocation();
  Future<Either<String, List<LocationEntities>>> getLocationSuggestions(
    String input,
  );
  Future<Either<String, LocationEntities>> getPlaceDetails(String placeId);
}
