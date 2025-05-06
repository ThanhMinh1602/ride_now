import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key, this.onChanged, required this.items});
  final Function(String?)? onChanged;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: items.first,
      style: AppStyle.body15RegularSecondary,
      isExpanded: true,

      icon: const SizedBox.shrink(),
      dropdownColor: AppColor.surfaceWhite,
      decoration: InputDecoration(
        fillColor: AppColor.surfaceWhite,

        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: SvgPicture.asset(Assets.icons.arrowDown),
        ),
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
      items:
          items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, overflow: TextOverflow.ellipsis),
            );
          }).toList(),

      onChanged: onChanged,
    );
  }
}
