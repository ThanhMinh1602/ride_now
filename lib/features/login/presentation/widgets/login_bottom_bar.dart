import 'package:car_booking/core/components/bottombar/auth_bottom_bar.dart';
import 'package:flutter/material.dart';

class LoginBottomBar extends StatelessWidget {
  const LoginBottomBar({super.key, this.onPressed, required this.onActionTap});
  final void Function()? onPressed;
  final void Function() onActionTap;

  @override
  Widget build(BuildContext context) {
    return AuthBottomBar(
      buttonText: 'Đăng nhập',
      onPressed: onPressed,
      questionText: 'Bạn chưa có tài khoản? ',
      actionText: 'Đăng ký ngay!',
      onActionTap: onActionTap,
    );
  }
}
