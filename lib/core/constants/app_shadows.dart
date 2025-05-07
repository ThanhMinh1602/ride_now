import 'package:car_booking/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();
  static BoxShadow medium = BoxShadow(
    color: AppColor.black.withOpacity(0.1),
    blurRadius: 16,
    offset: const Offset(0, 0),
  );
}
