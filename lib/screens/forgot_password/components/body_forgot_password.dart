import 'package:flutter/material.dart';
import 'package:xpress_entregas/components/custom_suffix_icon.dart';
import 'package:xpress_entregas/components/default_button.dart';
import 'package:xpress_entregas/components/form_error.dart';

import 'package:xpress_entregas/components/no_account_text.dart';
import 'package:xpress_entregas/providers/forgot.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class BodyForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account!",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  int phoneNumber;
  final forgotProvider = ForgotProvider();

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

  _inputNumber(int number) async {
    final input = await forgotProvider.requestCode(number);

    if (input == true) {
      mostrarAlerta(context, "Sucesso");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => phoneNumber = int.parse(newValue),
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPhoneNumberNullerror);
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value.isEmpty) {
                addError(error: kPhoneNumberNullerror);
                return "";
              }

              return null;
            },
            decoration: InputDecoration(
              labelText: "Phone Number",
              hintText: "Enter your phone number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                icon: Icons.phone_iphone,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(
            errors: errors,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _inputNumber(phoneNumber);
              }
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          NoAccountText()
        ],
      ),
    );
  }
}
