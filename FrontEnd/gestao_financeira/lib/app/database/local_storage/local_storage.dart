abstract class LocalStorage {
  Future<V?> read<V>(String key);
  Future<void> write<V>(String key, V value);
  Future<bool> containsKey(String key);
  Future<void> clear();
  Future<void> remove(String key);
  Future<void> clearLogin(String key);
  Future<bool> isFirstAccess();
  Future<bool> isThemeDark();
  Future<void> toggleTheme(bool value);
}

abstract class LocalSecureStorage {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<bool> containsKey(String key);
  Future<void> clear();
  Future<void> remove(String key);
  Future<void> clearLogin(String key);
  Future<bool> isFirstAccess();
  Future<bool> isThemeDark();
  Future<bool> toggleTheme(bool value);
}
