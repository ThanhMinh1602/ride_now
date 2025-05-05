import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_partners_event.dart';
part 'home_partners_state.dart';
part 'home_partners_bloc.freezed.dart';

class HomePartnersBloc extends Bloc<HomePartnersEvent, HomePartnersState> {
  HomePartnersBloc() : super(HomePartnersState()) {
    on<HomePartnersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
