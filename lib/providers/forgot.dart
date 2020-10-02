import 'dart:convert';

import 'package:http/http.dart' as http;

import '../local_storage.dart';


class ForgotProvider {
  
final String _apiUrl =
    "http://ec2-18-188-197-193.us-east-2.compute.amazonaws.com:8083";

final localStorage = LocalStorage();


  Future<bool> requestCode( int id ) async {
    
    final url = '$_apiUrl/SolicitarCodigoRecuperacao/{$id}';
   

    final resp = await http.put( url, body: id );
    print( resp );
 print( url );
    final decodedData = json.decode(resp.body);

    print( "DECODED: $decodedData" );

    return true;

  }
}



