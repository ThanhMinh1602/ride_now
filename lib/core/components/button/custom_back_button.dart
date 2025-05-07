import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_shadows.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:
          onPressed ??
          () {
            Navigator.of(context).pop();
          },

      padding: EdgeInsets.zero,
      icon: Container(
        width: 48.0,
        height: 48.0,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColor.white,
          shape: BoxShape.circle,
          boxShadow: [AppShadows.medium],
        ),
        child: SvgPicture.asset(Assets.icons.arrowLeftIc),
      ),
    );
  }
}
