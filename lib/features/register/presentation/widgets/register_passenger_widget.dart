import 'package:car_booking/core/components/appbar/custom_appbar.dart';
import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:car_booking/core/components/customtextfield/required_text_field.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/core/navigator/navigator.dart';
import 'package:car_booking/core/utils/validate_utils.dart';
import 'package:car_booking/features/register/presentation/widgets/register_bottom_bar_widget.dart';
import 'package:flutter/material.dart';

class RegisterPassengerWidget extends StatelessWidget {
  RegisterPassengerWidget({super.key});
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
                  Text('Đăng ký Đối tác', style: AppStyle.heading20BoldPrimary),
                  RequiredTextField(
                    labelText: 'Tên Đối tác',
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
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: RegisterBottomBar(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.getNavigator().push(screen: ScreenType.registerSuccess());
            }
          },
        ),
      ),
    );
  }
}
