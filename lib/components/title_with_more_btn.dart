import 'package:flutter/material.dart';

import '../constants.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);
  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(
            title: title,
          ),
          Spacer(),
          FlatButton(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20),
            // ),
            // color: kPrimaryColor,
            onPressed: () {},
            child: Text(
              "Ver mais",
              style: TextStyle(
                color: kPrimaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  final String title;
  const TitleWithCustomUnderline({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
          // Positioned(
          //   child: Container(
          //     margin: EdgeInsets.only(
          //         right: kDefaultPadding / 4, left: kDefaultPadding / 4),
          //     height: 7,
          //     color: kPrimaryColor.withOpacity(0.2),
          //   ),
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          // )
        ],
      ),
    );
  }
}
