import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/labeled_input_row_widget.dart';
import 'package:flutter/material.dart';

class CustomPriceInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  const CustomPriceInput({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledInputRowWidget(
      controller: controller,
      hintText: hintText ?? '250k',
      textInputType: TextInputType.phone,
      suffixWidget: SizedBox(
        width: 109,
        child: RichText(
          text: TextSpan(
            text: labelText ?? 'Giá thu khách',
            style: AppStyle.body15RegularPrimary,
            children: [
              TextSpan(
                text: '*',
                style: AppStyle.body15RegularPrimary.copyWith(
                  color: AppColor.accentAlert,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
