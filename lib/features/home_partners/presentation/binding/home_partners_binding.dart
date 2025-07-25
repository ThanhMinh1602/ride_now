import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/features/home_partners/presentation/bloc/home_partners_bloc.dart';
import 'package:flutter/widgets.dart';

class HomePartnersBinding {
  static HomePartnersBloc generateBloc(BuildContext context) {
    return HomePartnersBloc(navigator: context.getNavigator());
  }
}
