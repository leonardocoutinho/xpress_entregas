import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
    Auth({
        this.email,
        this.password,
        
    });

    String email;
    String password;

    factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
