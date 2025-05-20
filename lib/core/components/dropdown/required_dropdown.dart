import 'package:car_booking/core/components/dropdown/custom_dropdown.dart';
import 'package:car_booking/core/components/text/required_label_widget.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class RequiredDropdown extends StatelessWidget {
  const RequiredDropdown({
    super.key,
    required this.labelText,
    required this.items,
    this.isRequired = true,
    this.isHorizontal = false,
    this.spacing = 8.0,
    this.value,
    this.onChanged,
    this.hintText,
  });

  final String labelText;
  final List<String> items;
  final bool isRequired;
  final bool isHorizontal;
  final double spacing;
  final String? value;
  final Function(String?)? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final label = RequiredLabelWidget(
      labelText: labelText,
      isRequired: isRequired,
    );
    final dropdown = CustomDropdown(items: items, onChanged: onChanged);
    return isHorizontal
        ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: spacing,
          children: [label, Expanded(child: dropdown)],
        )
        : Column(
          spacing: spacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [label, dropdown],
        );
  }
}
