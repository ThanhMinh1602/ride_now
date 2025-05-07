part of 'map_bloc.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    LocationEntities? currentLocation,
    @Default([]) List<LocationEntities> locationHistories,
  }) = _MapState;
}
