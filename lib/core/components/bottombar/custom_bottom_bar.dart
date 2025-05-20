import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_shadows.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 104,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ).copyWith(bottom: 40.0),
      decoration: BoxDecoration(
        color: AppColor.surfaceWhite,
        boxShadow: [AppShadows.light],
      ),
      child: child,
    );
  }
}
