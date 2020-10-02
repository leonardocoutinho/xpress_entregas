import 'package:flutter/material.dart';

import 'package:xpress_entregas/components/custom_suffix_icon.dart';
import 'package:xpress_entregas/components/form_error.dart';

import 'package:xpress_entregas/components/default_button.dart';
import 'package:xpress_entregas/components/icon_custom.dart';
import 'package:xpress_entregas/providers/auth_provider.dart';
import 'package:xpress_entregas/screens/home/home_screen.dart';
import 'package:xpress_entregas/screens/forgot_password/forgot_password.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email, password;
  bool remember = false;
  bool _obscureText = true;
  final authProvider = AuthProvider();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: [
              Checkbox(
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
                value: remember,
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPassword.routeName);
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(
            errors: errors,
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(
            text: "Login",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _signIn(context);
              }
            },
          )
        ],
      ),
    );
  }

  _signIn(BuildContext context) async {
    Map info = await authProvider.signIn(email, password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else {
      mostrarAlerta(context, info["message"]);
    }
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: _obscureText,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 5) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 5) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        // hintStyle: TextStyle(color: kPrimaryColor),
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: "Enter Your Password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: InconCustom(
          icon: IconButton(
              icon: Icon(
                _obscureText ? Icons.lock_open : Icons.lock, color: kPrimaryColor,
              ),
              onPressed: () => _toggle()),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        // hintStyle: TextStyle(color: kPrimaryColor),
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: "Enter Your Email",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.mail_outline,
        ),
      ),
    );
  }
}
