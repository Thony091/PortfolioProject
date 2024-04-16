import 'package:shared_preferences/shared_preferences.dart';
import 'key_value_storage.dart';


class KeyValueStorageImpl extends KeyValueStorage {

  Future getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) {
    final prefs = getSharedPrefs();

    switch(T){
      case int:
        return prefs.then((value) => value.getInt(key) as T);
      case double:
        return prefs.then((value) => value.getDouble(key) as T);
      case String:
        return prefs.then((value) => value.getString(key) as T);
      case bool:
        return prefs.then((value) => value.getBool(key) as T);
      default:
        throw Exception('Type not supported: ${T.runtimeType}');
    }
  }
  
  @override
  Future<bool> removekey(String key) async {
    final prefs = await getSharedPrefs();
    return await prefs.remove(key);
  }
  
  @override
  Future<void> setKey<T>(String key, T value) async {
    final prefs = await getSharedPrefs();

    switch(T) {
      case int:
        prefs.setInt(key, value as int);
        break;
      case double:
        prefs.setDouble(key, value as double);
        break;
      case String:
        prefs.setString(key, value as String);
        break;
      case bool:
        prefs.setBool(key, value as bool);
        break;
      default:
        throw Exception('Type not supported: ${T.runtimeType}');
    }
  }
}