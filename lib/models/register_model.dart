// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    Register({
        this.sexo,
        this.email,
        this.password,
        this.ultimoNome,
        this.primeiroNome,
        this.contactoMovel,
    });

    List<String> sexo;
    List<String> email;
    List<String> password;
    List<String> ultimoNome;
    List<String> primeiroNome;
    List<String> contactoMovel;

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        sexo: List<String>.from(json["Sexo"].map((x) => x)),
        email: List<String>.from(json["Email"].map((x) => x)),
        password: List<String>.from(json["Password"].map((x) => x)),
        ultimoNome: List<String>.from(json["UltimoNome"].map((x) => x)),
        primeiroNome: List<String>.from(json["PrimeiroNome"].map((x) => x)),
        contactoMovel: List<String>.from(json["ContactoMovel"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Sexo": List<dynamic>.from(sexo.map((x) => x)),
        "Email": List<dynamic>.from(email.map((x) => x)),
        "Password": List<dynamic>.from(password.map((x) => x)),
        "UltimoNome": List<dynamic>.from(ultimoNome.map((x) => x)),
        "PrimeiroNome": List<dynamic>.from(primeiroNome.map((x) => x)),
        "ContactoMovel": List<dynamic>.from(contactoMovel.map((x) => x)),
    };
}
