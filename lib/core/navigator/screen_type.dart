part of 'navigator.dart';

@freezed
class ScreenType with _$ScreenType {
  factory ScreenType.home() = ScreenTypeHome;
  factory ScreenType.map(Role role) = ScreenTypeMap;

  factory ScreenType.welcome() = ScreenTypeWelcome;
  factory ScreenType.roleSelection(AuthScreenType authScreenType) =
      ScreenTypeRoleSelection;
  factory ScreenType.register(Role role) = ScreenTyperRegister;

  factory ScreenType.login(Role role) = ScreenTyperLogin;
}

class ScreenTypeHelper {
  static Widget page(ScreenType screenType) {
    switch (screenType) {
      case ScreenTypeHome():
        return const HomePartnersScreen();
      case ScreenTypeMap(role: final role):
        return MapScreen(role: role);
      case ScreenTypeWelcome():
        return WelcomeScreen();
      case ScreenTypeRoleSelection(authScreenType: final authScreenType):
        return RoleSelectionScreen(authScreenType: authScreenType);
      case ScreenTyperRegister(role: final role):
        return RegisterScreen(role: role);
      // case ScreenTypeTyperLogin(role: final role):
      //   return LoginScreen(role: role);
      default:
        return ErrorScreen();
    }
  }
}
