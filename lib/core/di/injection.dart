import 'package:car_booking/core/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => sl.init();
