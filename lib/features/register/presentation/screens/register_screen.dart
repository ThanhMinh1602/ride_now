import 'package:car_booking/core/components/role/role_helper_widget.dart';
import 'package:car_booking/core/enum/role.dart';
import 'package:car_booking/features/register/presentation/binding/register_binding.dart';
import 'package:car_booking/features/register/presentation/widgets/register_driver_widget.dart';
import 'package:car_booking/features/register/presentation/widgets/register_passenger_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.role});
  final Role role;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: RegisterBinding.generateBloc,
      child: RoleHelperWidget(
        role: role,
        driverWidget: RegisterDriverWidget(),
        passengerWidget: RegisterPassengerWidget(),
      ),
    );
  }
}
