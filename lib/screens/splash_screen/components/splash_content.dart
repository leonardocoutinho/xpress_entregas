import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';



class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.title,
    this.image,
  }) : super(key: key);

  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'XPRESS',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(title, textAlign: TextAlign.center,),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
