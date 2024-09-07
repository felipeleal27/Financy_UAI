import 'package:gestao_financeira/app/database/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _instace => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sharedPreferences = await _instace;
    sharedPreferences.clear();
  }

  @override
  Future<bool> containsKey(String key) async {
    final sharedPreferences = await _instace;
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<V?> read<V>(String key) async {
    final sharedPreferences = await _instace;
    return sharedPreferences.get(key) as V?;
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await _instace;
    sharedPreferences.remove(key);
  }

  @override
  Future<void> write<V>(String key, V value) async {
    final sharedPreferences = await _instace;

    switch (V) {
      case const (String):
        sharedPreferences.setString(key, value as String);
        break;
      case const (int):
        sharedPreferences.setInt(key, value as int);
        break;
      case const (double):
        sharedPreferences.setDouble(key, value as double);
        break;
      case const (bool):
        sharedPreferences.setBool(key, value as bool);
        break;
      case const (List):
        sharedPreferences.setStringList(key, value as List<String>);
        break;
      default:
        throw Exception('Type not supported');
    }
  }

  @override
  Future<void> clearLogin(String key) async {
    final sharedPreferences = await _instace;
    sharedPreferences.clear();

    await write<String>("codigoColetor", key);
  }
}
