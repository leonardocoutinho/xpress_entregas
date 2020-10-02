import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xpress_entregas/local_storage.dart';
// import 'package:xpress_entregas/models/register_model.dart';

class AuthProvider {
  final String _apiUrl =
      "http://ec2-18-188-197-193.us-east-2.compute.amazonaws.com:8083";

  final localStorage = LocalStorage();

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = "$_apiUrl/authenticate2";

    final authData = {
      "email": email,
      "password": password,
      "secureToken": true
    };

    final resp = await http.post(url, body: json.encode(authData), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });

    final decodedData = json.decode(resp.body);

    if (resp.statusCode == 200) {
      localStorage.token = decodedData['tokenuser'];
      return {'ok': true, 'token': decodedData['tokenuser']};
    }

    if (resp.statusCode == 400) {
      return {'ok': false, 'message': 'Usuario ou senha incorrectos'};
    }

    if (resp.statusCode == 500) {
      return {'ok': false, 'message': 'Servidor Down'};
    }
  }

  Future<Map<String, dynamic>> register(
    String email,
    String password,
    String primeiroNome,
    String ultimoNome,
    String contactoMovel,
    String sexo,
    String contactoAlternativo,
    String provincia,
    String municipio,
    String bairro,
    String rua,
    String nCasa,
    String userName,
// String image
  ) async {
    final url = "$_apiUrl/cadastrarcliente";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri)
      ..fields['email'] = email
      ..fields['password'] = password
      ..fields['primeiroNome'] = primeiroNome
      ..fields['ultimoNome'] = ultimoNome
      ..fields['contactoMovel'] = contactoMovel
      ..fields['sexo'] = sexo
      ..fields['contactoAlternativo'] = contactoAlternativo
      ..fields['provincia'] = provincia
      ..fields['municipio'] = municipio
      ..fields['bairro'] = bairro
      ..fields['rua'] = rua
      ..fields['nCasa'] = nCasa
      ..fields['userName'] = userName;

    var response = await request.send();
    print("RESPONSE: ${response.toString()}");

    if (response.statusCode == 200) {
      print('Uploaded!');

      return {'ok': true, 'response': response.contentLength};
    } else {
      return {'ok': false, 'mensaje': response.statusCode};
    }
  }

  Future<Map<String, dynamic>> completeProfile(
    String contactoAlternativo,
    String provincia,
    String municipio,
    String bairro,
    String rua,
    String nCasa,
    String userName,
// String image
  ) async {
    final url = "$_apiUrl/cadastrarcliente";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri)
      ..fields['contactoAlternativo'] = contactoAlternativo
      ..fields['provincia'] = provincia
      ..fields['municipio'] = municipio
      ..fields['bairro'] = bairro
      ..fields['rua'] = rua
      ..fields['nCasa'] = nCasa
      ..fields['userName'] = userName;
    // ..fields['image'] = image;

    var response = await request.send();
    print("RESPONSE: ${response.toString()}");
    print("STATUS: ${response.statusCode}");

    if (response.statusCode == 200) {
      print('Uploaded!');

      return {'ok': true, 'response': response.contentLength};
    } else {
      return {'ok': false, 'mensaje': response.statusCode};
    }
  }
}
