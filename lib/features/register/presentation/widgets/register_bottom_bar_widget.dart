import 'package:car_booking/core/components/bottombar/custom_bottom_bar.dart';
import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class RegisterBottomBar extends StatelessWidget {
  const RegisterBottomBar({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomBottomBar(
      child: Column(
        spacing: 16.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(text: 'Đăng ký', onPressed: onPressed),
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
    );
  }
}
