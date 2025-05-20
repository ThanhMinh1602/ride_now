import 'package:car_booking/core/components/customtextfield/required_text_field.dart';
import 'package:flutter/material.dart';

class CustomPriceInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String labelText;

  const CustomPriceInput({
    super.key,
    required this.controller,
    this.hintText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return RequiredTextField(
      controller: controller,
      hintText: hintText ?? '250k',
      labelTextWidth: 109,
      textInputType: TextInputType.phone,
      labelText: labelText,
    );
  }
}
