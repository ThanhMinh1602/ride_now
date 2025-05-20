import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Màn hình không được hổ trợ',
          style: AppStyle.heading20BoldWhite.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
