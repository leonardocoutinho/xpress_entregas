import 'package:flutter/material.dart';
import 'package:xpress_entregas/screens/signup/signup_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Não tem uma conta ? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        // SizedBox(width: 10,),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: Text(" Registe-se",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: kPrimaryColor)),
        )
      ],
    );
  }
}
