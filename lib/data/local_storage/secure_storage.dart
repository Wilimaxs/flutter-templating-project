import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage for sensitive data like tokens
/// Uses FlutterSecureStorage with AES encryption
class SecureStorage {
  static FlutterSecureStorage? _storage;

  static void init() {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    );
  }

  static FlutterSecureStorage get _instance {
    if (_storage == null) {
      init();
    }
    return _storage!;
  }

  static Future<void> save(String key, dynamic value) async {
    try {
      final data = {
        'value': value,
        'expiry': DateTime.now().add(const Duration(days: 1)).toIso8601String(),
      };
      await _instance.write(key: key, value: jsonEncode(data));
    } catch (e) {
      debugPrint('SecureStorage Save Error: $e');
    }
  }

  static Future<T?> read<T>(String key) async {
    try {
      final String? data = await _instance.read(key: key);
      if (data == null) return null;

      final Map<String, dynamic> decoded = jsonDecode(data);
      final expiryStr = decoded['expiry'] as String?;

      if (expiryStr != null &&
          DateTime.now().isAfter(DateTime.parse(expiryStr))) {
        await delete(key);
        return null;
      }
      final T? value = decoded['value'] as T?;
      if (value != null) {
        _instance
            .write(
              key: key,
              value: jsonEncode({
                'value': value,
                'expiry': DateTime.now()
                    .add(const Duration(days: 1))
                    .toIso8601String(),
              }),
            )
            .catchError((_) => null);
      }
      return value;
    } catch (e) {
      debugPrint('SecureStorage Read Error: $e');
      return null;
    }
  }

  static Future<void> delete(String key) async =>
      await _instance.delete(key: key);

  static Future<void> deleteAll() async => await _instance.deleteAll();
}
