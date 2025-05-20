import 'package:car_booking/core/components/bottombar/custom_bottom_bar.dart';
import 'package:car_booking/core/components/button/custom_button.dart';
import 'package:car_booking/core/enum/auth_screen.dart';
import 'package:car_booking/features/role_selection/presentation/bloc/role_selection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleBarWidget extends StatelessWidget {
  const RoleBarWidget({super.key, required this.authScreenType});
  final AuthScreenType authScreenType;
  @override
  Widget build(BuildContext context) {
    return CustomBottomBar(
      child: CustomButton(
        text: 'Tiếp tục',
        onPressed:
            () => context.read<RoleSelectionBloc>().add(
              RoleSelectionEvent.continueEvent(authScreenType),
            ),
      ),
    );
  }
}
