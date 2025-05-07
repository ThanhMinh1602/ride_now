part of 'map_bloc.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({LocationEntities? locationEntities}) = _MapState;
}
