import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptors {
  static InterceptorsWrapper get logging => InterceptorsWrapper(
    // Log request details
    onRequest: (options, handler) {
      debugPrint('━━━━━━━━━━━━━━━━ REQUEST ━━━━━━━━━━━━━━━━');
      debugPrint('URL: [${options.method}] ${options.baseUrl}${options.path}');
      if (options.data != null) {
        debugPrint('Body: ${options.data}');
      }
      if (options.queryParameters.isNotEmpty) {
        debugPrint('Params: ${options.queryParameters}');
      }
      debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      return handler.next(options);
    },

    // Log response details
    onResponse: (response, handler) {
      debugPrint('━━━━━━━━━━━━━━━━ RESPONSE ━━━━━━━━━━━━━━━');
      debugPrint(
        'Status: ${response.statusCode} | URL: ${response.requestOptions.path}',
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final message = data['message']?.toString();
        if (message != null) debugPrint('Msg: $message');
      } else if (data is List) {
        debugPrint('Data: List (${data.length} items)');
      }

      debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      return handler.next(response);
    },

    // Log error details
    onError: (error, handler) {
      debugPrint('━━━━━━━━━━━━━━━━━ ERROR ━━━━━━━━━━━━━━━━');
      debugPrint('Status: ${error.response?.statusCode}');
      debugPrint('URL: ${error.requestOptions.path}');
      debugPrint('Error: ${error.message}');

      final data = error.response?.data;
      if (data is Map<String, dynamic>) {
        debugPrint('Response Body: $data');
      }
      debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      return handler.next(error);
    },
  );
}
