part of 'role_selection_bloc.dart';

@freezed
abstract class RoleSelectionState with _$RoleSelectionState {
  const factory RoleSelectionState({
    @Default(false) bool isLoading,
    @Default(Role.passenger) Role roleSelected,
    @Default([]) List<Map<String, dynamic>> roles,
  }) = _Initial;
}
