part of 'navigator.dart';

@freezed
class ScreenType with _$ScreenType {
  factory ScreenType.home() = ScreenTypeHome;
  factory ScreenType.map(MapRole role) = ScreenTypeMap;
}

class ScreenTypeHelper {
  static Widget page(ScreenType screenType) {
    return switch (screenType) {
      ScreenTypeHome() => const HomePartnersScreen(),
      ScreenTypeMap(role: final role) => MapScreen(role: role),
      _ => const SizedBox(),
    };
  }
}
