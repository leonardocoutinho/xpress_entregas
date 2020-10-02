import 'package:flutter/material.dart';
import 'package:xpress_entregas/components/no_account_text.dart';
import 'package:xpress_entregas/screens/signin/components/signin_form.dart';
import 'package:xpress_entregas/size_config.dart';

class BodySignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Image.asset("assets/images/xpress_login.png"),
                Image.asset(
                  "assets/images/xpress.png",
                  height: 150,
                  width: 250,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                SignForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.06,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
