import 'package:flutter/material.dart';
import 'package:xpress_entregas/components/title_with_more_btn.dart';
import 'package:xpress_entregas/constants.dart';
import 'package:xpress_entregas/size_config.dart';

import 'category_list.dart';
import 'food_card.dart';
import 'header_content.dart';

class BodyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.35,
              color: kPrimaryColor,
              child: Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(30),
                ),
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(30)),
                    HeaderContent(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    CategoryList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(60)),
            TitleWithMoreBtn(
              title: "Para Si",
              press: () {},
            ),
            FoodCard(),
            SizedBox(height: getProportionateScreenHeight(15)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: Divider(),
            ),
            // SizedBox(height: getProportionateScreenHeight(15)),
            TitleWithMoreBtn(
              title: "As melhores pizzas",
              press: () {},
            ),

            Container(
              width: SizeConfig.screenWidth * 0.9,
              height: 185,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage("assets/images/pizza.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
          ],
        ),
      ),
    );
  }
}
