import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.21, 1.0],
          colors: AppColor.primaryGradient,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: child,
    );
  }
}
