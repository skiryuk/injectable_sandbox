abstract class ILocalStorage {
  Future<void> put(String key, dynamic value);
  Future<dynamic> get(String key);
  Future<void> delete(String key);
  Future<void> clearAll();
  Future<void> dispose();
}
