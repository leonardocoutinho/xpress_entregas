import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          blurRadius: 5.0,
          offset: Offset(0, 0.5),
          color: kTextColor
        )],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavItem(
                icon: Icons.home,
                tap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => EventsScreen(),
                  //   ),
                  // );
                },
              ),
              NavItem(
                icon: Icons.chat,
                tap: () {},
                isActive: true,
              ),
              NavItem(
                icon: Icons.room_service,
                tap: () {},
              ),
              NavItem(
                icon: Icons.person_outline,
                tap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key key,
    this.icon,
    this.isActive = false,
    this.tap,
  }) : super(key: key);

  final IconData icon;
  final bool isActive;
  final GestureTapCallback tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.all(5),
        height: getProportionateScreenHeight(60),
        width: getProportionateScreenWidth(60),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isActive) kDefaultShadow]),
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: kTextColor,
            ),
            // Spacer(),
            // Text(
            //   title,
            //   style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            // )
          ],
        ),
      ),
    );
  }
}
