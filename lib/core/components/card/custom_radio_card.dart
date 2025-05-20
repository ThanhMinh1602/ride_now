import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/gen/assets.gen.dart';

class CustomRadioCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final bool isBorder;
  final double borderWidth;
  final String? customSelectedIcon;
  final String? customUnselectedIcon;

  const CustomRadioCard({
    super.key,
    required this.isSelected,
    required this.child,
    this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.isBorder = false,
    this.borderWidth = 1,
    this.customSelectedIcon,
    this.customUnselectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        isSelected
            ? AppColor.primary
            : (isBorder ? AppColor.neutral200 : Colors.transparent);

    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: isSelected ? AppColor.primaryLight : Colors.transparent,
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: Row(
          children: [
            Expanded(child: child),
            SvgPicture.asset(
              isSelected
                  ? (customSelectedIcon ?? Assets.icons.radioSelected)
                  : (customUnselectedIcon ?? Assets.icons.radioUnselected),
            ),
          ],
        ),
      ),
    );
  }
}
