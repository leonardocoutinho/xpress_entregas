import 'package:flutter/material.dart';
import 'package:xpress_entregas/size_config.dart';

const kSecondaryColor = Color(0xFF190A39);

const kPrimaryColor = Color(0xFF008F63);

const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const double kDefaultPadding = 20.0;

final kDefaultShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 10,
  color: Color(0xFFE9E9E9).withOpacity(0.56),
);

final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const String kEmailNullError = "Please Enter Your Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter Your Password";
const String kShortPassError = "Password is Too Short";
const String kMatchPassError = "Password Dont Match";

const String kNameNullError = "Please enter your name";
const String kPhoneNumberNullerror = "Please enter your phone number";
const String kInvalidPhoneNumbererror = "Please enter a valid phone number";

const String kAddressNullError = "Please enter your address";

final otpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: getProportionateScreenWidth(15),
    ),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder());

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: kPrimaryColor),
  );
}


  void mostrarAlerta(BuildContext context, String mensaje) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ATENÇÃO'),
            content: Text(mensaje),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: kPrimaryColor),
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
