import 'package:car_booking/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child, this.margin});
  final Widget child;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      margin: margin ?? EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColor.surfaceWhite,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 16.0,
            color: AppColor.black.withOpacity(0.1),
          ),
        ],
      ),
      child: child,
    );
  }
}
