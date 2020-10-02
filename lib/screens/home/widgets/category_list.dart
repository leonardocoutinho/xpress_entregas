import 'package:flutter/material.dart';
import 'package:xpress_entregas/screens/home/widgets/search_field.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          top: 95,
          child: Container(
            width: SizeConfig.screenWidth * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              // border: Border.all(width: 1, color: kTextColor),
              boxShadow: [
                BoxShadow(
                  blurRadius: 60,
                  offset: Offset(0, 10),
                  color: kPrimaryColor.withOpacity(0.15)
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItems(
                    icon: Icons.palette,
                    title: "Comida",
                  ),
                  CategoryItems(
                    icon: Icons.local_cafe,
                    title: "Bebidas",
                  ),
                  CategoryItems(
                    icon: Icons.cake,
                    title: "Sobremesas",
                  ),
                ],
              ),
            ),
          ),
        ),
        SearchField(),
      ],
    );
  }
}

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 50,
          color: kPrimaryColor,
        ),
        Text("$title"),
      ],
    );
  }
}
