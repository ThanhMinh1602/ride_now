import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:car_booking/core/components/customtextfield/custom_text_field.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/labeled_input_row_widget.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/location_input_widget.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/option_selection_widget.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookCarNowWidget extends StatelessWidget {
  const BookCarNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomCard(
        child: SingleChildScrollView(
          child: Column(
            spacing: 12.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              OptionSelectionWidget(
                onChanged: (value) {
                  print(value);
                },
              ),
              LocationInputWidget(),
              LabeledInputRowWidget(
                hintText: 'Số điện thoại',
                textInputType: TextInputType.phone,
                suffixWidget: SvgPicture.asset(Assets.icons.profileIc),
              ),
              CustomButton(
                text: 'Đặt xe ngay',
                onPressed: () {
                  print('Book Now');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
