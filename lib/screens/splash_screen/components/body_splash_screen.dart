import 'package:flutter/material.dart';
import 'package:xpress_entregas/components/default_button.dart';
import 'package:xpress_entregas/screens/signin/signin_screen.dart';
import 'package:xpress_entregas/screens/splash_screen/components/splash_content.dart';

import '../../../size_config.dart';
import '../../../constants.dart';

class BodySplashScreen extends StatefulWidget {
  @override
  _BodySplashScreenState createState() => _BodySplashScreenState();
}

class _BodySplashScreenState extends State<BodySplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to XPress, Let's Shop!",
      "image": "assets/images/xpress_car.png"
    },
    {
      "text": "We need people conect with store \naround Angola",
      "image": "assets/images/xpress_bag.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/xpress_helmet.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                image: splashData[index]["image"],
                title: splashData[index]["text"],
              ),
            ),
            flex: 3,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDots(index: index),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  DefaultButton(
                    text: "Avançar",
                    press: () {
                      Navigator.pushReplacementNamed(
                          context, SignInScreen.routeName);
                    },
                  ),
                  Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDots({index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      width: currentPage == index ? 20 : 6,
      height: 6,
      // padding: EdgeInsets.only(right: 150),
      margin: EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadiusDirectional.circular(3),
      ),
    );
  }
}
