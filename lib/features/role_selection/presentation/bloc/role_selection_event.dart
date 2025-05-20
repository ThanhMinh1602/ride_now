part of 'role_selection_bloc.dart';

@freezed
class RoleSelectionEvent with _$RoleSelectionEvent {
  const factory RoleSelectionEvent.initial() = InitialEvent;

  const factory RoleSelectionEvent.selectRole(Role role) = SelectRoleEvent;
  const factory RoleSelectionEvent.continueEvent(
    AuthScreenType authScreenType,
  ) = ContinueEvent;
}
