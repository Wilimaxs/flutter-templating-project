import 'package:template_flutter/data/local_storage/secure_storage.dart';
import 'package:template_flutter/data/local_storage/storage.dart';

class StorageManager {
  static Future<void> init() async {
    await Storage.init();
    SecureStorage.init();
  }

  // storage Save method with isSecure parameter
  static Future<void> save(
    String key,
    dynamic value, {
    bool isSecure = false,
  }) async {
    if (isSecure) {
      await SecureStorage.save(key, value);
    } else {
      await Storage.save(key, value);
    }
  }

  // storage Read method with isSecure parameter
  static Future<T?> read<T>(String key, {bool isSecure = false}) async {
    if (isSecure) {
      return await SecureStorage.read<T>(key);
    } else {
      return Storage.read<T>(key);
    }
  }

  // storage Delete method with isSecure parameter
  static Future<void> delete(String key, {bool isSecure = false}) async {
    if (isSecure) {
      await SecureStorage.delete(key);
    } else {
      await Storage.delete(key);
    }
  }

  // Delete all data from both storages
  static Future<void> deleteAll() async {
    await Future.wait<void>([
      Storage.deleteAll().then<void>((_) {}),
      SecureStorage.deleteAll(),
    ]);
  }
}
