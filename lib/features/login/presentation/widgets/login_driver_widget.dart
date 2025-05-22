import 'package:car_booking/core/components/appbar/custom_appbar.dart';
import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:car_booking/core/components/customtextfield/required_text_field.dart';
import 'package:car_booking/core/components/dropdown/required_dropdown.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/core/enum/role.dart';
import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/core/navigator/navigator.dart';
import 'package:car_booking/core/utils/validate_utils.dart';
import 'package:car_booking/features/login/presentation/widgets/login_bottom_bar.dart';
import 'package:car_booking/features/register/presentation/widgets/register_bottom_bar_widget.dart';
import 'package:flutter/material.dart';

class LoginDriverWidget extends StatelessWidget {
  LoginDriverWidget({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.unfocus,
      child: Scaffold(
        backgroundColor: AppColor.surfaceGrey,
        appBar: CustomAppbar(
          title: 'Đăng nhập',
          subTitle: 'Cùng RideNow kiếm thu nhập nhé!',
        ),
        body: Form(
          key: _formKey,
          child: CustomCard(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Đăng nhập Tài xế',
                    style: AppStyle.heading20BoldPrimary,
                  ),

                  RequiredTextField(
                    labelText: 'Số điện thoại',
                    hintText: 'Nhập số điện thoại',
                    validator: ValidateUtils.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: 16.0),
                  RequiredTextField(
                    labelText: 'Mật khẩu',
                    hintText: 'Nhập Mật khẩu',
                    isPassword: true,
                    validator: ValidateUtils.validatePassword,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Quên mật khẩu?',
                        textAlign: TextAlign.end,
                        style: AppStyle.body15RegularSecondaryItalic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: LoginBottomBar(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.getNavigator().push(screen: ScreenType.registerSuccess());
            }
          },
          onActionTap:
              () => context.getNavigator().push(
                screen: ScreenType.register(Role.driver),
              ),
        ),
      ),
    );
  }
}
