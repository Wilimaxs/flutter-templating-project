import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:template_flutter/feature/auth/authentication.dart';

import 'environment.dart';
import 'errorMapper/error_handler.dart';
import 'interceptors/dio_interceptors.dart';
import 'interceptors/dio_options_builder.dart';

/// Creates and exposes the shared Dio instance and HTTP request methods.
class DioInitializer {
  DioInitializer() : dio = _createDio(Environment.baseUrl);

  final Dio dio;

  static Dio _createDio(String baseUrl) {
    final client = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    if (kDebugMode) client.interceptors.add(DioInterceptors.logging);
    return client;
  }

  Future<T> get<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuth = true,
  }) => _request(
    'GET',
    url,
    parser: parser,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
    requiresAuth: requiresAuth,
  );

  Future<T> post<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuth = true,
  }) => _request(
    'POST',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
    requiresAuth: requiresAuth,
  );

  Future<T> put<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuth = true,
  }) => _request(
    'PUT',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
    requiresAuth: requiresAuth,
  );

  Future<T> patch<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuth = true,
  }) => _request(
    'PATCH',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
    requiresAuth: requiresAuth,
  );

  Future<T> delete<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuth = true,
  }) => _request(
    'DELETE',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
    requiresAuth: requiresAuth,
  );

  Future<T> _request<T>(
    String method,
    String url, {
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    required bool requiresAuth,
  }) async {
    try {
      final options = await DioOptionsBuilder.build(
        requiresAuth: requiresAuth,
        headers: headers,
      );
      final response = await dio.request<Object?>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options.copyWith(method: method),
        cancelToken: cancelToken,
      );
      final responseData = response.data;
      if (responseData is Map<String, dynamic>) return parser(responseData);
      return parser(<String, dynamic>{});
    } catch (error) {
      if (requiresAuth &&
          error is DioException &&
          error.response?.statusCode == 401) {
        await Get.find<AuthenticationService>().logout();
      }
      throw ErrorHandler.toNetworkException(error);
    }
  }
}
