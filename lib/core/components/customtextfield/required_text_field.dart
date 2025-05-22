import 'package:car_booking/core/components/customtextfield/custom_text_field.dart';
import 'package:car_booking/core/components/text/required_label_widget.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class RequiredTextField extends StatelessWidget {
  const RequiredTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.isRequired = true,
    this.isHorizontal = false,
    this.spacing = 8.0,
    this.labelTextWidth,
    this.textInputType,
    this.controller,
    this.isPassword = false,
    this.validator,
    this.textInputAction,
  });

  final String labelText;
  final String hintText;
  final bool isRequired;
  final bool isHorizontal;
  final double spacing;
  final double? labelTextWidth;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final label = RequiredLabelWidget(
      labelText: labelText,
      isRequired: isRequired,
    );

    final textField = CustomTextField(
      validator: validator,
      isPassword: isPassword,
      hintText: hintText,
      textInputType: textInputType,
      controller: controller,
      textInputAction: textInputAction,
    );

    return isHorizontal
        ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: labelTextWidth, child: label),
            SizedBox(width: spacing),
            Expanded(child: textField),
          ],
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [label, SizedBox(height: spacing), textField],
        );
  }
}
