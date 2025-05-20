import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.suffixIcon,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.onTap,
    this.validator,
    this.isPassword = false,
    this.onTapSuffixIcon,
  });

  final String? suffixIcon;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final void Function()? onTap;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final void Function()? onTapSuffixIcon;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTap: widget.onTap,
      obscureText: widget.isPassword ? _obscureText : false,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      keyboardType:
          widget.isPassword
              ? TextInputType.visiblePassword
              : widget.textInputType ?? TextInputType.text,
      style: AppStyle.body15RegularSecondary.copyWith(
        color: AppColor.textPrimary,
      ),
      cursorColor: AppColor.primary,
      validator: widget.validator,
      decoration: InputDecoration(
        hintStyle: AppStyle.body15RegularSecondary,
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        suffixIcon: _buildSuffixIcon(),
        filled: true,
        fillColor: AppColor.surfaceWhite,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColor.neutral200, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColor.accentAlert, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColor.accentAlert, width: 1.0),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: SvgPicture.asset(
            _obscureText ? Assets.icons.hideIc : Assets.icons.showIc,
            width: 20.0,
            height: 20.0,
          ),
        ),
      );
    } else if (widget.suffixIcon != null) {
      return GestureDetector(
        onTap: widget.onTapSuffixIcon,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: SvgPicture.asset(
            widget.suffixIcon!,
            color: AppColor.neutral900,
            width: 20.0,
            height: 20.0,
          ),
        ),
      );
    }
    return null;
  }
}
