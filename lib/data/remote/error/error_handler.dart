import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/auth/authentication.dart';

class ErrorHandler {
  static Function(String message)? onShowMessage;
  static Function()? onUnauthorized;
  static Function()? onForbidden;

  static String _handleBadResponse(int? statusCode) {
    return switch (statusCode) {
      400 => 'Request invalid',
      401 => 'Session expired, please log in again',
      403 => 'You do not have access',
      404 => 'Data not found',
      422 => 'Invalid data entered',
      429 => 'Too many requests, please try again later',
      500 => 'Server is experiencing issues',
      _ => 'Server response error ($statusCode)',
    };
  }

  static String getUserFriendlyMessage(DioException error) {
    // Get response message from API if available
    final apiMessage = error.response?.data is Map
        ? error.response?.data['message']?.toString()
        : null;

    if (apiMessage != null && apiMessage.isNotEmpty) return apiMessage;

    //  if no API message, handle based on error type
    return switch (error.type) {
      DioExceptionType.connectionTimeout => 'Connection to server timed out',
      DioExceptionType.sendTimeout => 'Failed to send data to server',
      DioExceptionType.receiveTimeout => 'Failed to receive data from server',
      DioExceptionType.connectionError => 'Internet connection lost',
      DioExceptionType.badResponse => _handleBadResponse(
        error.response?.statusCode,
      ),
      DioExceptionType.cancel => 'Request canceled',
      _ =>
        (error.message?.toLowerCase().contains('socket') ?? false)
            ? 'Internet connection issue'
            : 'System error occurred',
    };
  }

  static void handleAction(int? statusCode) {
    if (statusCode == 401) {
      Get.find<AuthenticationService>().logout();
      onUnauthorized?.call();
    }
    if (statusCode == 403) onForbidden?.call();
  }
}
