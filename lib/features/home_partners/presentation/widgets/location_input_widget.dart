import 'package:car_booking/core/components/customtextfield/custom_text_field.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationInputWidget extends StatelessWidget {
  const LocationInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        SvgPicture.asset(Assets.icons.locationPick),
        Expanded(
          child: Column(
            spacing: 12.0,
            children: [
              CustomTextField(
                hintText: 'Nhập điểm đón',
                suffixIcon: Assets.icons.locationIc,
              ),
              CustomTextField(
                hintText: 'Nhập điểm đến',
                suffixIcon: Assets.icons.mapIc,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
