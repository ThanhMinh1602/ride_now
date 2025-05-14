part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.initial() = InitialEvent;

  const factory MapEvent.selectLocation(LocationEntities location) =
      SelectLocationEvent;
  const factory MapEvent.submitLocation(LocationEntities location) =
      SubmitLocationEvent;

  const factory MapEvent.searchLocation(String input) = SearchLocationEvent;
}
