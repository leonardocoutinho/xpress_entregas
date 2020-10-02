import 'package:flutter/material.dart';

import 'components/body_otp.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/opt_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
        centerTitle: true,
      ),
      body: BodyOTP(),
    );
  }
}