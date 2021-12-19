import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/data/app_routes/app_routes.dart';
import 'package:travel_app/pages/entrance_screen.dart';
import 'package:travel_app/pages/splash_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive,
    );
    return MaterialApp(
      initialRoute: AppRoutes.splashScreen,
      routes: {
        AppRoutes.splashScreen: (context) => SplashScreen(),
        AppRoutes.EntranceScreen: (context) => EntranceScreen(),
      },
    );
  }
}
