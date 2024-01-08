class KeyDataBase<T> {
  final String key;
  final T defaultValue;

  KeyDataBase(this.key, this.defaultValue);
}

class KeyStore {
  static KeyDataBase isFirstLaunch = KeyDataBase<bool>("isFirstLaunch", true);
}
