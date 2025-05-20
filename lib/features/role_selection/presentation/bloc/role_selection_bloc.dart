import 'package:bloc/bloc.dart';
import 'package:car_booking/core/enum/auth_screen.dart';
import 'package:car_booking/core/enum/role.dart';
import 'package:car_booking/core/navigator/navigator.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_selection_event.dart';
part 'role_selection_state.dart';
part 'role_selection_bloc.freezed.dart';

class RoleSelectionBloc extends Bloc<RoleSelectionEvent, RoleSelectionState> {
  RoleSelectionBloc({required this.navigator}) : super(_Initial()) {
    on(_onInit);
    on(_onRoleSelection);
    on(_onContinue);
    add(InitialEvent());
  }
  final AppNavigator navigator;
  final List<Map<String, dynamic>> roles = [
    {
      'title': 'Đối tác đặt xe',
      'image': Assets.images.receptionist,
      'value': Role.passenger,
    },
    {'title': 'Tài xế', 'image': Assets.images.driver, 'value': Role.driver},
  ];
  void _onInit(InitialEvent event, Emitter<RoleSelectionState> emit) {
    emit(state.copyWith(roles: roles));
  }

  void _onRoleSelection(
    SelectRoleEvent event,
    Emitter<RoleSelectionState> emit,
  ) {
    emit(state.copyWith(roleSelected: event.role));
  }

  void _onContinue(ContinueEvent event, Emitter<RoleSelectionState> emit) {
    navigator.push(
      screen:
          event.authScreenType == AuthScreenType.login
              ? ScreenType.login(state.roleSelected)
              : ScreenType.register(state.roleSelected),
    );
  }
}
