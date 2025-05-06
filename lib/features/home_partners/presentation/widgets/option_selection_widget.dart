import 'package:car_booking/core/components/radio/radio_list.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionSelectionWidget extends StatelessWidget {
  final List<String>? items;
  final Function(String)? onChanged;

  const OptionSelectionWidget({super.key, this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(Assets.icons.carIc, width: 20.0, height: 20.0),
        Expanded(
          child: RadioList(
            items: items ?? ['Xe 4 chỗ', 'Xe 7 chỗ'],
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
