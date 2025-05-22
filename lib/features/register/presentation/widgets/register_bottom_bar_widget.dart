import 'package:car_booking/core/components/bottombar/auth_bottom_bar.dart';
import 'package:car_booking/core/components/bottombar/custom_bottom_bar.dart';
import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class RegisterBottomBar extends StatelessWidget {
  const RegisterBottomBar({
    super.key,
    this.onPressed,
    required this.onActionTap,
  });
  final void Function()? onPressed;
  final void Function() onActionTap;

  @override
  Widget build(BuildContext context) {
    return AuthBottomBar(
      buttonText: 'Đăng ký',
      onPressed: onPressed,
      questionText: 'Bạn đã có tài khoản? ',
      actionText: 'Đăng nhập ngay!',
      onActionTap: onActionTap,
    );
  }
}
