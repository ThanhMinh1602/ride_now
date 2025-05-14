import 'package:car_booking/core/enum/role.dart';
import 'package:car_booking/features/map/presentation/binding/map_binding.dart';
import 'package:car_booking/features/map/presentation/widgets/map_driver_widget.dart';
import 'package:car_booking/features/map/presentation/widgets/map_passenger_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, required this.role});

  final Role role;

  Widget _buildRoleWidget() {
    switch (role) {
      case Role.driver:
        return const MapDriverWidget();
      case Role.passenger:
        return const MapPassengerWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: MapBinding.generateBloc,
      child: _buildRoleWidget(),
    );
  }
}
