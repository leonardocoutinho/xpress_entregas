import 'package:flutter/material.dart';
import 'package:xpress_entregas/screens/splash_screen/components/body_splash_screen.dart';
import 'package:xpress_entregas/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "splash_screen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodySplashScreen(),
    );
  }
}