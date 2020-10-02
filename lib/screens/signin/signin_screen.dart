import 'package:flutter/material.dart';

import 'components/body_signin_screen.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "signin_screen";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySignInScreen(),
    );
  }
}