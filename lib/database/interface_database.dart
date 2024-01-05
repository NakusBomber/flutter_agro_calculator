
abstract class IDataBase {
  Future<void> init();
  Future<T> get<T>(String key, T defaultValue);
  Future<void> set<T>(String key, T value);
}