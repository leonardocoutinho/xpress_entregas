import 'package:flutter/material.dart';

import '../../../constants.dart';

class RoundedImageProfile extends StatelessWidget {
  const RoundedImageProfile({
    Key key,
    @required this.image,
  }) : super(key: key);

  final Icon image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: -100,
      child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
                color: kPrimaryColor, width: 7, style: BorderStyle.solid),
          ),
          child: image),
    );
  }
}
