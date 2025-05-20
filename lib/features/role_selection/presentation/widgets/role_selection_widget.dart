import 'package:car_booking/core/components/appbar/custom_appbar.dart';
import 'package:car_booking/core/components/card/custom_radio_card.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/core/enum/auth_screen.dart';
import 'package:car_booking/features/role_selection/presentation/bloc/role_selection_bloc.dart';
import 'package:car_booking/features/role_selection/presentation/widgets/role_bar_widget.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RoleSelectionWidget extends StatelessWidget {
  const RoleSelectionWidget({super.key, required this.authScreenType});
  final AuthScreenType authScreenType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.surfaceGrey,
      appBar: CustomAppbar(
        title:
            authScreenType == AuthScreenType.register ? 'Đăng ký' : 'Đăng nhập',
        subTitle: 'Cùng RideNow kiếm thu nhập nhé!',
      ),
      body: BlocBuilder<RoleSelectionBloc, RoleSelectionState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 23.0,
            ),
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Bạn là?', style: AppStyle.heading18SemiBoldPrimary),
                ...List.generate(state.roles.length, (index) {
                  return CustomRadioCard(
                    onTap:
                        () => context.read<RoleSelectionBloc>().add(
                          RoleSelectionEvent.selectRole(
                            state.roles[index]['value']!,
                          ),
                        ),
                    isSelected:
                        state.roles[index]['value'] == state.roleSelected,
                    borderWidth: 2.0,
                    isBorder: true,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 8.0,
                      children: [
                        SvgPicture.asset(
                          state.roles[index]['image'] ?? Assets.images.driver,
                        ),
                        Text(state.roles[index]['title'] ?? ''),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: RoleBarWidget(authScreenType: authScreenType),
    );
  }
}
