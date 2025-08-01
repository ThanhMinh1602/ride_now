import 'package:car_booking/core/navigator/navigator.dart';
import 'package:car_booking/core/di/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SFProDisplay'),
      navigatorObservers: [NavigatorObserver()],
      home: ScreenTypeHelper.page(ScreenType.welcome()),
    );
  }
}
