import 'package:dio/dio.dart';

import 'network_exception.dart';

class ErrorHandler {
  ErrorHandler._();

  /// Converts transport and parsing errors into messages the app can display.
  static NetworkException toNetworkException(Object error) {
    if (error is NetworkException) return error;
    if (error is FormatException) return const InvalidResponseFormat();
    if (error is! DioException) {
      return DefaultNetworkException(error.toString());
    }

    final apiMessage = _readApiMessage(error.response?.data);
    if (apiMessage != null) {
      return DefaultNetworkException(apiMessage);
    }

    if (error.type == DioExceptionType.badResponse) {
      return _fromStatusCode(error.response?.statusCode);
    }

    return switch (error.type) {
      DioExceptionType.cancel => const RequestCancelled(),
      DioExceptionType.connectionTimeout => const RequestTimeout(),
      DioExceptionType.sendTimeout => const SendTimeout(),
      DioExceptionType.receiveTimeout => const ReceiveTimeout(),
      DioExceptionType.connectionError => const NoInternetConnection(),
      _ => const DefaultNetworkException('An unexpected error occurred.'),
    };
  }

  static String? _readApiMessage(Object? data) {
    if (data is! Map) return null;
    final value = data['message']?.toString().trim();
    return value == null || value.isEmpty ? null : value;
  }

  static NetworkException _fromStatusCode(int? statusCode) {
    return switch (statusCode) {
      400 => const BadRequest(),
      401 => const UnauthorisedRequest(),
      403 => const ForbiddenRequest(),
      404 => const NotFound(),
      405 => const MethodNotAllowed(),
      408 => const RequestTimeout(),
      422 => const UnprocessableRequest(),
      429 => const TooManyRequests(),
      500 => const InternalServerError(),
      _ => DefaultNetworkException(
        'The server returned an unexpected status code ($statusCode).',
      ),
    };
  }
}
