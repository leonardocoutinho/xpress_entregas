import 'package:flutter/material.dart';

import '../size_config.dart';


class InconCustom extends StatelessWidget {
  const InconCustom({
    Key key, @required this.icon,
  }) : super(key: key);

  final IconButton icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(8),
        getProportionateScreenWidth(8),
        getProportionateScreenWidth(8),
      ),
      child: icon,
    );
  }
}
