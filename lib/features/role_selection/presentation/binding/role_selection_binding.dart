import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/features/role_selection/presentation/bloc/role_selection_bloc.dart';
import 'package:flutter/widgets.dart';

class RoleSelectionBinding {
  static RoleSelectionBloc generateBloc(BuildContext context) {
    return RoleSelectionBloc(navigator: context.getNavigator());
  }
}
