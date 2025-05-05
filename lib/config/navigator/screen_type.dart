part of 'navigator.dart';

@freezed
class ScreenType with _$ScreenType {
  factory ScreenType.home() = ScreenTypeHome;
}

class ScreenTypeHelper {
  static Widget page(ScreenType screenType) {
    return switch (screenType) {
      ScreenTypeHome() => const HomePartnersScreen(),

      ScreenType() => throw UnimplementedError(),
    };
  }
}
