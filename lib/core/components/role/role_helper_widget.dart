import 'package:car_booking/core/enum/role.dart';
import 'package:flutter/material.dart';

class RoleHelperWidget extends StatelessWidget {
  final Role role;
  final Widget driverWidget;
  final Widget passengerWidget;

  const RoleHelperWidget({
    super.key,
    required this.role,
    required this.driverWidget,
    required this.passengerWidget,
  });

  @override
  Widget build(BuildContext context) {
    switch (role) {
      case Role.driver:
        return driverWidget;
      case Role.passenger:
        return passengerWidget;
    }
  }
}
