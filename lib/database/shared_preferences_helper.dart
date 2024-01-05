import 'package:agro_calculator/database/interface_database.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DataBasePrefs implements IDataBase {
  DataBasePrefs();

  late final SharedPreferences _prefs;

  @override
  Future<T> get<T>(String key, T defaultValue) async {

    Object? value;
    try {
      if (!_prefs.containsKey(key)) {
        await set(key, defaultValue);
        return defaultValue;
      }

      if (sameTypes<T, List<String>>()) {
        value = _prefs.getStringList(key);
      } else {
        value = _prefs.get(key);
      }

      return value as T;
    }
    catch (e, s) {
      return defaultValue;
    }
  }

  @override
  Future<void> set<T>(String key, T value) async {
    if (sameTypes<T, bool>()) {
      await _prefs.setBool(key, value as bool);
      return;
    }

    if (sameTypes<T, int>()) {
      await _prefs.setInt(key, value as int);
      return;
    }

    if (sameTypes<T, double>()) {
      await _prefs.setDouble(key, value as double);
      return;
    }

    if (sameTypes<T, String>()) {
      await _prefs.setString(key, value as String);
      return;
    }

    if (sameTypes<T, List<String>>()) {
      await _prefs.setStringList(key, value as List<String>);
      return;
    }

    if (value is Enum) {
      await _prefs.setInt(key, value.index);
      return;
    }

    throw Exception('Wrong type for saving to database');
  }

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool sameTypes<S, V>() {
    void func<X extends S>() {}
    return func is void Function<X extends V>();
  }

}