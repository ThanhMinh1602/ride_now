import 'package:car_booking/core/components/background/gradient_background.dart';
import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.only(
            top:
                MediaQuery.of(context).padding.top +
                context.calculateSize(45.0),
          ),
          child: Column(
            spacing: context.calculateSize(88.0),
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                Assets.icons.logoSmall.path,
                width: context.calculateSize(122.02),
              ),
              CustomCard(
                child: Column(
                  spacing: context.calculateSize(16.0),
                  children: [
                    SvgPicture.asset(
                      Assets.icons.successIc,
                      width: context.calculateSize(80.0),
                    ),
                    Text(
                      'Đăng ký thành công',
                      style: AppStyle.heading20BoldPrimary,
                    ),
                    Text(
                      'Bạn đã đăng ký tài khoản thành công. Cùng RideNow kiếm thêm thu nhập ngay!',
                      textAlign: TextAlign.center,
                      style: AppStyle.body15RegularSecondary,
                    ),
                    CustomButton(text: 'Đến trang chủ', onPressed: () {}),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
