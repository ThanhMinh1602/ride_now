import 'package:car_booking/core/components/bottombar/custom_bottom_bar.dart';
import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthBottomBar extends StatelessWidget {
  const AuthBottomBar({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.questionText,
    required this.actionText,
    required this.onActionTap,
  });

  final String buttonText;
  final VoidCallback? onPressed;
  final String questionText;
  final String actionText;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    return CustomBottomBar(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(text: buttonText, onPressed: onPressed),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              text: questionText,
              style: AppStyle.body15RegularSecondary,
              children: [
                TextSpan(
                  text: actionText,
                  style: AppStyle.heading15SemiBoldAccentAlert,
                  recognizer: TapGestureRecognizer()..onTap = onActionTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
