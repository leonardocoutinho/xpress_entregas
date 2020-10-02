import 'package:flutter/material.dart';
import 'package:xpress_entregas/size_config.dart';

import 'components/body_complete_profile.dart';


class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/profile_screen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete profile"),
        centerTitle: true,
      ),
      body: BodyCompleteProfile(),
    );
  }
}