import 'package:car_booking/core/navigator/navigator.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double calculateSize(double designSize, {double baseWidth = 390}) {
    return screenWidth * (designSize / baseWidth);
  }

  AppNavigator getNavigator() => AppNavigator.fromContext(this);
}
