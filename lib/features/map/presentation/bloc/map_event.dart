part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.initial() = InitialEvent;

  const factory MapEvent.selectLocation(LocationEntities location) =
      SelectLocationEvent;
}
