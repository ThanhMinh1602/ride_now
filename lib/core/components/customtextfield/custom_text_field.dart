import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.suffixIcon,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.textInputType,
  });
  final String? suffixIcon;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.text,
      style: AppStyle.body15RegularSecondary.copyWith(
        color: AppColor.textPrimary,
      ),
      cursorColor: AppColor.primary,
      decoration: InputDecoration(
        hintStyle: AppStyle.body15RegularSecondary,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.0,
        ).copyWith(left: 16.0),
        suffixIcon:
            suffixIcon != null
                ? Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 14.0,
                  ).copyWith(right: 16.0),
                  child: SvgPicture.asset(
                    suffixIcon!,
                    color: AppColor.neutral900,
                  ),
                )
                : null,
        filled: true,
        fillColor: AppColor.surfaceWhite,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColor.neutral200, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColor.primary, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColor.accentAlert, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColor.accentAlert, width: 1.0),
        ),
      ),
    );
  }
}
