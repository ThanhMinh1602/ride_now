part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({@Default(false) bool isLoading}) = _LoginState;
}
