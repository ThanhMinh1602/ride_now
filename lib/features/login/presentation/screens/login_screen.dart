import 'package:car_booking/core/components/role/role_helper_widget.dart';
import 'package:car_booking/core/enum/role.dart';
import 'package:car_booking/features/login/presentation/binding/login_binding.dart';
import 'package:car_booking/features/login/presentation/widgets/login_driver_widget.dart';
import 'package:car_booking/features/login/presentation/widgets/login_passenger_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.role});
  final Role role;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: LoginBinding.generateBloc,
      child: RoleHelperWidget(
        role: role,
        driverWidget: LoginDriverWidget(),
        passengerWidget: LoginPassengerWidget(),
      ),
    );
    ;
  }
}
