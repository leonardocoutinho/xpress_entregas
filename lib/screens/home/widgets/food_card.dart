import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class FoodCard extends StatelessWidget {
  const FoodCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          FeaturedFood(
            press: null,
            image: "assets/images/burguer.jpg",
          ),
          FeaturedFood(
            press: null,
            image: "assets/images/picanha.jpeg",
          ),
          FeaturedFood(
            press: null,
            image: "assets/images/lunch.jpg",
          )
        ],
      ),
    );
  }
}

class FeaturedFood extends StatelessWidget {
  const FeaturedFood({
    Key key,
    this.press,
    this.image,
  }) : super(key: key);

  final GestureTapCallback press;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2),
        width: SizeConfig.screenWidth * 0.7,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
