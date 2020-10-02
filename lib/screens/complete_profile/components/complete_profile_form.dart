import 'package:flutter/material.dart';
import 'package:xpress_entregas/components/custom_suffix_icon.dart';
import 'package:xpress_entregas/components/default_button.dart';
import 'package:xpress_entregas/components/form_error.dart';
import 'package:xpress_entregas/providers/auth_provider.dart';
import 'package:xpress_entregas/screens/login_success/login_success.dart';

import 'package:xpress_entregas/screens/otp/otp_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String contactoAlternativo,
      provincia,
      municipio,
      bairro,
      rua,
      nCasa,
      userName,
      image;
  final authProvider = AuthProvider();

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
          buildPhoneNumberAlternativeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildProvinciaFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMunicipioFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildBairroFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRuaFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNumeroCasaFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          
          FormError(
            errors: errors,
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _submitProfile(context);
                // Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  _submitProfile(BuildContext context) async {
    Map info = await authProvider.completeProfile(contactoAlternativo,
        provincia, municipio, bairro, rua, nCasa, userName);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, LoginSuccess.routeName);
    } else {
      mostrarAlerta(context, "FAlhou" );
      // info["message"]
    }
  }

  TextFormField buildRuaFormField() {
    return TextFormField(
      onSaved: (newValue) => rua = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: kPrimaryColor),
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.location_off,
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberAlternativeFormField() {
    return TextFormField(
      onSaved: (newValue) => contactoAlternativo = newValue,
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
        labelStyle: TextStyle(color: kPrimaryColor),
        labelText: "Phone Number",
        hintText: "Enter Alternative Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.phone_iphone,
        ),
      ),
    );
  }

  TextFormField buildProvinciaFormField() {
    return TextFormField(
      onSaved: (newValue) => provincia = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: kPrimaryColor),
        labelText: "Provincia",
        hintText: "Ex: Luanda",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.location_searching
        ),
      ),
    );
  }

  TextFormField buildMunicipioFormField() {
    return TextFormField(
      onSaved: (newValue) => municipio = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: kPrimaryColor),
        labelText: "Municipio",
        hintText: "Ex: Sambizanga",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.my_location,
        ),
      ),
    );
  }

  TextFormField buildBairroFormField() {
    return TextFormField(
      onSaved: (newValue) => bairro = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: kPrimaryColor),
        labelText: "Bairro",
        hintText: "Ex: Marçal",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.location_city,
        ),
      ),
    );
  }

  TextFormField buildNumeroCasaFormField() {
    return TextFormField(
      onSaved: (newValue) => nCasa = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: kPrimaryColor),
        labelText: "Nº Casa",
        hintText: "Ex: 35",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.location_on,
        ),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      onSaved: (newValue) => userName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: kPrimaryColor),
        labelText: "Username",
        hintText: "Ex: adiebo",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.person,
        ),
      ),
    );
  }
}
