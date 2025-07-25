part of 'navigator.dart';

@freezed
sealed class ScreenType with _$ScreenType {
  const factory ScreenType.home() = Home;
  const factory ScreenType.map(Role role) = GoogleMap;
  const factory ScreenType.welcome() = Welcome;
  const factory ScreenType.roleSelection(AuthScreenType authScreenType) =
      RoleSelection;
  const factory ScreenType.register(Role role) = Register;
  const factory ScreenType.registerSuccess() = RegisterSuccess;
  const factory ScreenType.login(Role role) = Login;
  const factory ScreenType.forgotPassword() = ForgotPassword;
  const factory ScreenType.confirmOtp() = ConfirmOtp;
  const factory ScreenType.changePasswordSuccess() = ChangePasswordSuccess;
  const factory ScreenType.changePassword() = ChangePassword;
}

class ScreenTypeHelper {
  static Widget page(ScreenType screenType) {
    return switch (screenType) {
      Home() => HomePartnersScreen(),
      GoogleMap(:final role) => MapScreen(role: role),
      Welcome() => WelcomeScreen(),
      RoleSelection(:final authScreenType) => RoleSelectionScreen(
        authScreenType: authScreenType,
      ),
      Register(:final role) => RegisterScreen(role: role),
      RegisterSuccess() => RegisterSuccessScreen(),
      Login(:final role) => LoginScreen(role: role),

      ForgotPassword() => ForgotPasswordScreen(),

      ConfirmOtp() => throw ConfirmOtpScreen(),

      ChangePasswordSuccess() => ChangePasswordSuccessScreen(),

      ChangePassword() => throw ChangePasswordScreen(),
    };
  }
}
