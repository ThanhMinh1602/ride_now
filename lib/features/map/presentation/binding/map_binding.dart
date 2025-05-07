import 'package:car_booking/core/di/injection.dart';
import 'package:car_booking/features/map/domain/usecase/get_current_location_usecase.dart';
import 'package:car_booking/features/map/domain/usecase/get_location_history_usecase.dart';
import 'package:car_booking/features/map/presentation/bloc/map_bloc.dart';
import 'package:flutter/material.dart';

class MapBinding {
  static MapBloc generateBloc(BuildContext context) {
    return MapBloc(
      getCurrentLocationUsecase: sl<GetLocationUsecase>(),
      getLocationHistoryUseCase: sl<GetLocationHistoryUseCase>(),
    );
  }
}
