import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:

  Inicializar en el main
    final prefs = new LocalStorage();
    await prefs.initPrefs();
    
    Recuerden que el main() debe de ser async {...

*/

class LocalStorage {
  static final LocalStorage _instancia = new LocalStorage._internal();

  factory LocalStorage() {
    return _instancia;
  }

  LocalStorage._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    // WidgetsFlutterBinding.ensureInitialized();

    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del nombre
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
