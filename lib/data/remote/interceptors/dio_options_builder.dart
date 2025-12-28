import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/data/local_storage/storage_manager.dart';
import 'package:ppob_koperasi_payment/feature/auth/authentication.dart';

class DioOptionsBuilder {
  static Future<Options> build({
    int sendTimeout = 60000,
    int receiveTimeout = 60000,
  }) async {
    final Map<String, dynamic> newHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final token = await StorageManager.read<String>('token', isSecure: true);
    final xTokenPin = await StorageManager.read<String>(
      'xTokenPin',
      isSecure: true,
    );

    if (token == null) {
      Get.find<AuthenticationService>().logout();
    }

    if (token != null && token.isNotEmpty) {
      newHeaders["Authorization"] = "Bearer $token";
    }
    if (xTokenPin != null && xTokenPin.isNotEmpty) {
      newHeaders["xTokenPin"] = xTokenPin;
    }

    return Options(
      headers: newHeaders,
      sendTimeout: Duration(milliseconds: sendTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
    );
  }
}
