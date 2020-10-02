import 'package:flutter/material.dart';

import '../../../size_config.dart';


class HeaderContent extends StatelessWidget {
  const HeaderContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.menu,
          color: Colors.white,
        ),
        SizedBox(
          width: getProportionateScreenWidth(30),
        ),
        Text(
          "Escolha o que \ndeseja pedir",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
