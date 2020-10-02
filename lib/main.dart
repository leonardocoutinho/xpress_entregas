import 'package:flutter/material.dart';
import 'package:xpress_entregas/routes.dart';
import 'package:xpress_entregas/screens/complete_profile/complete_profile_screen.dart';
import 'package:xpress_entregas/screens/forgot_password/forgot_password.dart';
import 'package:xpress_entregas/screens/signup/signup_screen.dart';
import 'package:xpress_entregas/screens/splash_screen/splash_screen.dart';
import 'package:xpress_entregas/local_storage.dart';
import 'package:xpress_entregas/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localStorage = LocalStorage();

  await localStorage.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpress Entregas App',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: ForgotPassword.routeName,
      routes: routes,
    );
  }
}
