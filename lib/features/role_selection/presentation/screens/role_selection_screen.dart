import 'package:car_booking/core/enum/auth_screen.dart';
import 'package:car_booking/features/role_selection/presentation/binding/role_selection_binding.dart';
import 'package:car_booking/features/role_selection/presentation/widgets/role_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key, required this.authScreenType});
  final AuthScreenType authScreenType;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: RoleSelectionBinding.generateBloc,
      child: RoleSelectionWidget(authScreenType: authScreenType),
    );
  }
}
