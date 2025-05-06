import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:car_booking/core/components/customtextfield/custom_text_field.dart';
import 'package:car_booking/core/components/dropdown/custom_dropdown.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/custom_price_input.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/labeled_input_row_widget.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/location_input_widget.dart';
import 'package:car_booking/features/home_partners/presentation/widgets/option_selection_widget.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookCarForTourWidget extends StatelessWidget {
  const BookCarForTourWidget({super.key});

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
              _buildInputLocation(),
              Row(
                spacing: 12.0,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.icons.discoveryIc),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: CustomDropdown(
                            items: List.generate(
                              10,
                              (index) => '${index + 1} ngày',
                            ),
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.icons.clockIc),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: CustomTextField(hintText: 'Thời gian đón'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 13.0,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.icons.calendarIc),
                        const SizedBox(width: 8.0),
                        Expanded(child: CustomTextField(hintText: 'Ngày đi')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      spacing: 19.0,
                      children: [
                        SvgPicture.asset(Assets.icons.lineIc, width: 8.0),

                        Expanded(child: CustomTextField(hintText: 'Ngày về')),
                      ],
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
              CustomButton(text: 'Đặt xe ngay', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildInputLocation() {
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
              Row(
                spacing: 12.0,
                children: [
                  Expanded(
                    child: CustomDropdown(
                      items: ['Liên tỉnh', 'Nội tỉnh'],
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                  Expanded(child: CustomTextField(hintText: 'Nhập tỉnh thành')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
