import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class RequiredLabelWidget extends StatelessWidget {
  const RequiredLabelWidget({
    super.key,
    required this.labelText,
    this.isRequired = true,
  });

  final String labelText;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: labelText,
        style: AppStyle.body15RegularPrimary,
        children:
            isRequired
                ? [
                  TextSpan(
                    text: ' *',
                    style: AppStyle.body15RegularPrimary.copyWith(
                      color: AppColor.accentAlert,
                    ),
                  ),
                ]
                : null,
      ),
    );
  }
}
