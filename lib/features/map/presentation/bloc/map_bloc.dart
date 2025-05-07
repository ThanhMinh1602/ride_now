import 'package:bloc/bloc.dart';
import 'package:car_booking/features/map/domain/entities/location_entities.dart';
import 'package:car_booking/features/map/domain/usecase/get_location_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_event.dart';
part 'map_state.dart';
part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({required this.locationUsecase}) : super(MapState()) {
    on(_onInit);
  }
  final GetLocationUsecase locationUsecase;
}

extension MapBlocExtension on MapBloc {
  Future<void> _onInit(InitialEvent event, Emitter<MapState> emit) async {
    final result = await locationUsecase();
    result.fold(
      (l) {
        print(l);
      },
      (r) {
        print('${r.latitude} - ${r.longitude}');
        emit(state.copyWith(locationEntities: r));
      },
    );
  }
}
