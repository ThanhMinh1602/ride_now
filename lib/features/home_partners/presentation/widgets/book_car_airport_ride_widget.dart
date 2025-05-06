import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/custom_price_input.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/labeled_input_row_widget.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/location_input_widget.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/option_selection_widget.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookCarAirportRideWidget extends StatelessWidget {
  const BookCarAirportRideWidget({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LabeledInputRowWidget(
                      hintText: 'Ngày đi',
                      textInputType: TextInputType.text,
                      suffixWidget: SvgPicture.asset(Assets.icons.calendarIc),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: LabeledInputRowWidget(
                      hintText: 'Thời gian đón',
                      textInputType: TextInputType.text,
                      suffixWidget: SvgPicture.asset(Assets.icons.clockIc),
                    ),
                  ),
                ],
              ),
              LabeledInputRowWidget(
                hintText: 'Nhập số điện thoại của khách hàng',
                textInputType: TextInputType.phone,
                suffixWidget: SvgPicture.asset(Assets.icons.profileIc),
              ),
              CustomPriceInput(
                controller: TextEditingController(),
                hintText: '250k',
                labelText: 'Giá thu khách',
              ),
              CustomPriceInput(
                controller: TextEditingController(),
                hintText: '250k',
                labelText: 'Giá giao xe',
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
