import 'package:car_booking/core/components/error/input_error.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.onChanged,
    required this.items,
    this.validator,
    this.value,
    this.hintText,
  });

  final Function(String?)? onChanged;
  final List<String> items;
  final FormFieldValidator<String>? validator;
  final String? value;
  final String? hintText;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: widget.value,
          style: AppStyle.body15RegularSecondary,

          isExpanded: true,
          icon: const SizedBox.shrink(),
          dropdownColor: AppColor.surfaceWhite,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppStyle.body15RegularSecondary,
            fillColor: AppColor.surfaceWhite,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: SvgPicture.asset(
                Assets.icons.arrowDown,
                width: 20.0,
                height: 20.0,
                color: AppColor.neutral900,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColor.neutral200,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColor.accentAlert,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColor.accentAlert,
                width: 1.0,
              ),
            ),
            errorStyle: const TextStyle(
              height: 0,
              fontSize: 0,
            ), // Ẩn errorText mặc định
          ),
          items:
              widget.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.body15RegularSecondary,
                  ),
                );
              }).toList(),
          onChanged: (value) {
            setState(() {
              _errorMessage = widget.validator?.call(value);
            });
            widget.onChanged?.call(value);
          },
          validator: (value) {
            final error = widget.validator?.call(value);
            setState(() {
              _errorMessage = error;
            });
            return error;
          },
        ),
        if (_errorMessage != null) ...[
          const SizedBox(height: 8.0),
          InputError(errorMessage: _errorMessage),
        ],
      ],
    );
  }
}
