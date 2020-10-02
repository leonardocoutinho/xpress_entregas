import 'package:flutter/material.dart';
import 'package:xpress_entregas/components/nav_bar.dart';
import 'package:xpress_entregas/screens/home/widgets/body_home_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      
      body: BodyHomeScreen(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
