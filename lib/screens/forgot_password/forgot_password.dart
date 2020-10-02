import 'package:flutter/material.dart';
import 'package:xpress_entregas/size_config.dart';

import 'components/body_forgot_password.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = "/forgot_password";
  const ForgotPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
       appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: BodyForgotPassword(),
    );
  }
}