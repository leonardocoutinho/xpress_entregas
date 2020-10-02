import 'package:flutter/material.dart';

import 'package:xpress_entregas/components/social_card.dart';
import 'package:xpress_entregas/screens/signup/components/signup_form.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class BodySignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Text("Register Account", style: headingStyle),
            Text(
              "Complete your details or continue \nwith social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.07),
            SignUpForm(),
            SizedBox(height: SizeConfig.screenHeight * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: Icon(Icons.offline_pin),
                  press: () {},
                ),
                SocialCard(
                  icon: Icon(Icons.network_wifi),
                  press: () {},
                ),
                SocialCard(
                  icon: Icon(Icons.movie_filter),
                  press: () {},
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Text(
              "By continuing your confirm that you agree \nwith our Terme and Condition",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
