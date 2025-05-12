import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:car_booking/core/navigator/navigator.dart';
import 'package:car_booking/features/map/presentation/screens/map_screen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_partners_event.dart';
part 'home_partners_state.dart';
part 'home_partners_bloc.freezed.dart';

class HomePartnersBloc extends Bloc<HomePartnersEvent, HomePartnersState> {
  final AppNavigator navigator;
  HomePartnersBloc({required this.navigator}) : super(HomePartnersState()) {
    on(openMap);
  }
}

extension HomePartnersExtension on HomePartnersBloc {
  Future<void> openMap(
    OpenMapEvent event,
    Emitter<HomePartnersState> emit,
  ) async {
    navigator.push(screen: ScreenType.map(MapRole.passenger));
  }
}
