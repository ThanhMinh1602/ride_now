import 'package:car_booking/core/components/background/gradient_background.dart';
import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/enum/auth_screen.dart';
import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/core/navigator/navigator.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              Assets.icons.logoIcPng.path,
              width: context.calculateSize(230.0),
            ),
            SizedBox(height: context.calculateSize(186.0)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ).copyWith(bottom: 40.0),
              child: Column(
                spacing: 16.0,
                children: [
                  CustomButton(
                    text: 'Đăng nhập',
                    backgroundColor: AppColor.neutral900,
                    foregroundColor: AppColor.white,
                    onPressed:
                        () => context.getNavigator().push(
                          screen: ScreenType.roleSelection(
                            AuthScreenType.login,
                          ),
                        ),
                  ),
                  CustomButton(
                    text: 'Đăng ký',
                    backgroundColor: AppColor.white,
                    foregroundColor: AppColor.neutral900,
                    onPressed:
                        () => context.getNavigator().push(
                          screen: ScreenType.roleSelection(
                            AuthScreenType.register,
                          ),
                        ),
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
