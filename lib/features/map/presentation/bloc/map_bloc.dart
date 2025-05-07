// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:car_booking/features/map/domain/entities/location_entity.dart';
import 'package:car_booking/features/map/domain/usecase/get_location_history_usecase.dart';
import 'package:car_booking/features/map/domain/usecase/get_current_location_usecase.dart';

part 'map_bloc.freezed.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({
    required this.getCurrentLocationUsecase,
    required this.getLocationHistoryUseCase,
  }) : super(MapState()) {
    on(_onInit);
  }
  final GetLocationUsecase getCurrentLocationUsecase;
  final GetLocationHistoryUseCase getLocationHistoryUseCase;
}

extension MapBlocExtension on MapBloc {
  Future<void> _onInit(InitialEvent event, Emitter<MapState> emit) async {
    try {
      final currentLocation = await getCurrentLocationUsecase();
      final locationHistories = await getLocationHistoryUseCase();
      for (var element in locationHistories) {
        print('${element.title}\n');
      }
      emit(
        state.copyWith(
          currentLocation: currentLocation,
          locationHistories: locationHistories,
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
