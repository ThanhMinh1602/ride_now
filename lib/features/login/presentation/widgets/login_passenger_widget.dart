import 'package:car_booking/core/components/appbar/custom_appbar.dart';
import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:car_booking/core/components/customtextfield/required_text_field.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/core/enum/role.dart';
import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/core/navigator/navigator.dart';
import 'package:car_booking/core/utils/validate_utils.dart';
import 'package:car_booking/features/login/presentation/widgets/login_bottom_bar.dart';
import 'package:flutter/material.dart';

class LoginPassengerWidget extends StatelessWidget {
  LoginPassengerWidget({super.key});
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
                spacing: 16.0,
                children: [
                  Text(
                    'Đăng nhập Đối tác',
                    style: AppStyle.heading20BoldPrimary,
                  ),
                  RequiredTextField(
                    labelText: 'Tên đối tác',
                    hintText: 'Nhập tên',
                    validator: ValidateUtils.validateName,
                    textInputType: TextInputType.name,
                  ),
                  RequiredTextField(
                    labelText: 'Số điện thoại',
                    hintText: 'Nhập số điện thoại',
                    validator: ValidateUtils.validatePhoneNumber,
                    textInputType: TextInputType.phone,
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
                screen: ScreenType.register(Role.passenger),
              ),
        ),
      ),
    );
  }
}
