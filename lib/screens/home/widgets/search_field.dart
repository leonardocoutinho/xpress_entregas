import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: SizeConfig.screenWidth * 0.65,
          decoration: BoxDecoration(
            // color: kSecondaryColor.withOpacity(0.1),
            color: Color(0xFF5A8F7E),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Procurar",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.search, color: Colors.white,),
              contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(9),
              ),
            ),
          ),
        ),
        Container(
          height: getProportionateScreenHeight(47),
          width: SizeConfig.screenWidth * 0.2,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              color: Color(0xFF87AA9F),
              // border: Border.all(width: 6, color: Colors.grey),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: Icon(Icons.menu),
        )
      ],
    );
  }
}
