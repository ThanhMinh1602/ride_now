import 'package:car_booking/core/components/appbar/custom_appbar.dart';
import 'package:car_booking/core/components/bottombar/custom_bottom_bar.dart';
import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:car_booking/core/components/customtextfield/required_text_field.dart';
import 'package:car_booking/core/components/dropdown/required_dropdown.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/core/navigator/navigator.dart';
import 'package:car_booking/core/utils/validate_utils.dart';
import 'package:flutter/material.dart';

class RegisterDriverWidget extends StatelessWidget {
  RegisterDriverWidget({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.unfocus,
      child: Scaffold(
        backgroundColor: AppColor.surfaceGrey,
        appBar: CustomAppbar(
          title: 'Đăng ký',
          subTitle: 'Cùng RideNow kiếm thu nhập nhé!',
        ),
        body: Form(
          key: _formKey,
          child: CustomCard(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16.0,
                children: [
                  Text('Đăng ký Tài xế', style: AppStyle.heading20BoldPrimary),
                  RequiredTextField(
                    labelText: 'Tên tài xế',
                    hintText: 'Họ và tên',
                    validator: ValidateUtils.validateName,
                    textInputType: TextInputType.name,
                  ),
                  RequiredTextField(
                    labelText: 'Số điện thoại',
                    hintText: 'Nhập số điện thoại',
                    validator: ValidateUtils.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                  ),
                  RequiredTextField(
                    labelText: 'Mật khẩu',
                    hintText: 'Nhập Mật khẩu',
                    isPassword: true,
                    validator: ValidateUtils.validatePassword,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  Row(
                    spacing: 16.0,
                    children: [
                      Expanded(
                        child: RequiredDropdown(
                          labelText: 'Loại xe',
                          hintText: 'Chọn loại xe',
                          items: ['Xe 4 chổ', 'Xe 6 chổ', 'Xe 16 chổ'],
                          validator:
                              (value) => ValidateUtils.validateDropdown(
                                value,
                                'loại xe',
                              ),
                          onChanged: (value) {},
                        ),
                      ),
                      Expanded(
                        child: RequiredDropdown(
                          labelText: 'Hãng xe',
                          hintText: 'Chọn hãng xe',
                          items: ['Hyundai', 'Kia', 'Mec', 'Toyota'],
                          validator:
                              (value) => ValidateUtils.validateDropdown(
                                value,
                                'loại xe',
                              ),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 16.0,
                    children: [
                      Expanded(
                        child: RequiredTextField(
                          labelText: 'Biển số xe',
                          hintText: 'Nhập biển số xe',
                          validator: ValidateUtils.validateLicensePlate,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      Expanded(
                        child: RequiredDropdown(
                          labelText: 'Màu xe',
                          hintText: 'Chọn màu xe',
                          items: ['Trắng', 'Đỏ', 'Đen', 'Vàng'],
                          validator:
                              (value) => ValidateUtils.validateDropdown(
                                value,
                                'màu xe',
                              ),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          child: Column(
            spacing: 16.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                text: 'Đăng ký',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.getNavigator().push(
                      screen: ScreenType.registerSuccess(),
                    );
                  }
                },
              ),
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
      ),
    );
  }
}
