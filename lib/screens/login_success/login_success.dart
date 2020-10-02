import 'package:flutter/material.dart';

import 'components/body_login_success.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
        centerTitle: true,
      ),
      body: BodyLoginSuccess(),
    );
  }
}