import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputError extends StatelessWidget {
  const InputError({super.key, required String? errorMessage})
    : _errorMessage = errorMessage;

  final String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.icons.errorIc,
          width: 12.0,
          height: 12.0,
          color: AppColor.accentAlert,
        ),
        const SizedBox(width: 4.0),
        Expanded(
          child: Text(
            _errorMessage!,
            style: AppStyle.body12RegularItalicAccentAlert,
          ),
        ),
      ],
    );
  }
}
