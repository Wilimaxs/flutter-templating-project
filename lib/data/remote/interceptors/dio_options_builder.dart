import 'package:dio/dio.dart';
import 'package:template_flutter/data/local_storage/storage_manager.dart';

class DioOptionsBuilder {
  static Future<Options> build({Map<String, dynamic>? headers}) async {
    final requestHeaders = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final token = await StorageManager.read<String>('token', isSecure: true);

    if (token != null && token.isNotEmpty) {
      requestHeaders['Authorization'] = 'Bearer $token';
    }

    requestHeaders.addAll(headers ?? const {});

    return Options(headers: requestHeaders);
  }
}
