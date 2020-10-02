import 'package:flutter/widgets.dart';
import 'package:xpress_entregas/screens/complete_profile/complete_profile_screen.dart';
import 'package:xpress_entregas/screens/forgot_password/forgot_password.dart';
import 'package:xpress_entregas/screens/home/home_screen.dart';
import 'package:xpress_entregas/screens/login_success/login_success.dart';
import 'package:xpress_entregas/screens/otp/otp_screen.dart';
import 'package:xpress_entregas/screens/signin/signin_screen.dart';
import 'package:xpress_entregas/screens/signup/signup_screen.dart';
import 'package:xpress_entregas/screens/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  OtpScreen.routeName: (context) => OtpScreen(),
  LoginSuccess.routeName: (context) => LoginSuccess(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
};
