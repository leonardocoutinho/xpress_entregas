import 'package:flutter/material.dart';

import 'package:xpress_entregas/components/custom_suffix_icon.dart';
import 'package:xpress_entregas/components/default_button.dart';
import 'package:xpress_entregas/components/form_error.dart';
import 'package:xpress_entregas/providers/auth_provider.dart';

// import 'package:xpress_entregas/screens/complete_profile/complete_profile_screen.dart';
import 'package:xpress_entregas/screens/login_success/login_success.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  final List<String> errors = [];
  bool remember = false;

  String sexo;

  final authProvider = AuthProvider();

  String contactoMovel;

  String ultimoNome;

  String primeiroNome;

  String contactoAlternativo;
  String provincia;
  String municipio;
  String bairro;
  String rua;
  String nCasa;
  String userName;

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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConfPassFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildFirstnameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildLastNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
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
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            Row(
              children: [
                Text("Genero"),
                Checkbox(
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;

                      remember == true ? sexo = "M" : sexo = "false";
                    });
                  },
                  value: remember,
                ),
              ],
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _register(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  _register(BuildContext context) async {
    final result = await authProvider.register(
        email,
        password,
        primeiroNome,
        ultimoNome,
        contactoMovel,
        sexo,
        contactoAlternativo,
        provincia,
        municipio,
        bairro,
        rua,
        nCasa,
        userName);
    if (result.isNotEmpty) {
      Navigator.pushNamed(context, LoginSuccess.routeName);
    } else {
      print("USUARIO JA EXISTE");
      mostrarAlerta(context, "Usuario já existe");
    }
  }

  TextFormField buildConfPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Confirm Password",
        labelText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.lock_outline,
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 5) {
          removeError(error: kShortPassError);
        }
        password = value;
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
        hintText: "Enter Your Password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.lock_outline,
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
        hintText: "Enter Your Email",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.mail_outline,
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      onSaved: (newValue) => contactoMovel = newValue,
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
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => ultimoNome = newValue,
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
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.person,
        ),
      ),
    );
  }

  TextFormField buildFirstnameFormField() {
    return TextFormField(
      onSaved: (newValue) => primeiroNome = newValue,
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
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.person,
        ),
      ),
    );
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
        suffixIcon: CustomSuffixIcon(icon: Icons.location_searching),
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
