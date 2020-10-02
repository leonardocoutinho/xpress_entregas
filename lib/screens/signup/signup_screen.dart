import 'package:flutter/material.dart';
import 'package:xpress_entregas/size_config.dart';

import './components/body_signup_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signup_screen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
        ),
        body: BodySignUp());
  }
}
