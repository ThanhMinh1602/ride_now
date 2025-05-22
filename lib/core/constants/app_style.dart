import 'package:car_booking/core/constants/app_color.dart';
import 'package:flutter/material.dart';

// Tên thuộc tính	Giá trị số	Độ đậm (Mô tả)
// FontWeight.w100	100	Thin
// FontWeight.w200	200	ExtraLight
// FontWeight.w300	300	Light
// FontWeight.w400	400	Regular / Normal
// FontWeight.w500	500	Medium
// FontWeight.w600	600	SemiBold
// FontWeight.w700	700	Bold
// FontWeight.w800	800	ExtraBold
// FontWeight.w900	900	Black
class AppStyle {
  AppStyle._();
  static TextStyle heading20BoldPrimary = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.5,
    letterSpacing: 0,
    color: AppColor.primary,
  );
  static TextStyle heading20BoldWhite = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.5,
    letterSpacing: 0,
    color: AppColor.white,
  );
  static const TextStyle heading18SemiBoldPrimary = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.5,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.textPrimary,
  );

  static TextStyle heading16SemiBoldPrimary = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.5,
    letterSpacing: 0.0,
    color: AppColor.textPrimary,
  );
  static TextStyle heading15SemiBoldPrimary = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 1.5,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.textPrimary,
  );
  static TextStyle heading15SemiBoldAccentAlert = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 1.5,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.accentAlert,
  );

  static const TextStyle k12RegularWhite = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.5,
    letterSpacing: 0,
    color: AppColor.white,
  );
  static const TextStyle body12RegularItalicAccentAlert = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    fontSize: 12.0,
    height: 1.5,
    letterSpacing: 0.0,
    color: AppColor.accentAlert,
  );
  static const TextStyle body12SemiBoldPrimary = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 1.5,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.textPrimary,
  );

  static const TextStyle body14RegularPrimary2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.5,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.textPrimary2,
  );

  static const TextStyle k14SemiBoldActive = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 1.5,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.primary,
  );

  static const TextStyle body15RegularPrimary = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 1.5,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.textPrimary,
  );
  static const TextStyle body15RegularSecondary = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 1.5,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.textSecondary,
  );

  static const TextStyle body12RegularPrimary = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.5,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.textPrimary,
  );

  static const TextStyle buttonLarge18Medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 1.3,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
    color: AppColor.white,
  );
}
