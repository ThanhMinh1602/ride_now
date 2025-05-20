import 'package:car_booking/core/components/appbar/custom_appbar.dart';
import 'package:car_booking/core/components/bottombar/custom_bottom_bar.dart';
import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:car_booking/core/components/customtextfield/required_text_field.dart';
import 'package:car_booking/core/components/dropdown/custom_dropdown.dart';
import 'package:car_booking/core/components/dropdown/required_dropdown.dart';
import 'package:car_booking/core/components/text/required_label_widget.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class RegisterDriverWidget extends StatelessWidget {
  const RegisterDriverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.surfaceGrey,
      appBar: CustomAppbar(
        title: 'Đăng ký',
        subTitle: 'Cùng RideNow kiếm thu nhập nhé!',
      ),
      body: CustomCard(
        child: Column(
          spacing: 16.0,
          children: [
            Text('Đăng ký Tài xế', style: AppStyle.heading20BoldPrimary),
            RequiredTextField(labelText: 'Tên tài xế', hintText: 'Họ và tên'),
            RequiredTextField(
              labelText: 'Số điện thoại',
              hintText: 'Nhập số điện thoại',
            ),
            RequiredTextField(
              labelText: 'Mật khẩu',
              hintText: 'Nhập Mật khẩu',
              isPassword: true,
            ),
            Row(
              spacing: 16.0,
              children: [
                Expanded(
                  child: RequiredDropdown(
                    labelText: 'Loại xe',
                    items: ['Xe 4 chổ', 'Xe 6 chổ', 'Xe 16 chổ'],
                    onChanged: (value) {},
                  ),
                ),
                Expanded(
                  child: RequiredDropdown(
                    labelText: 'Hãng xe',
                    items: ['Hyundai', 'Kia', 'Mec', 'Toyota'],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        child: Column(
          spacing: 16.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(text: 'Đăng ký', onPressed: () {}),
            RichText(
              text: TextSpan(
                text: 'Bạn đã có tài khoản? ',
                style: AppStyle.body15RegularSecondary,
                children: [
                  TextSpan(
                    text: 'Đăng nhập ngay!',
                    style: AppStyle.heading15SemiBoldAccentAlert,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
