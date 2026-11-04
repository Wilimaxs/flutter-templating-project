import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'environment.dart';
import 'interceptors/dio_interceptors.dart';

/// Creates and exposes the shared Dio instance and HTTP request methods.
class DioInitializer {
  DioInitializer() : dio = _createDio(Environment.baseUrl);

  final Dio dio;

  static Dio _createDio(String baseUrl) {
    final client = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (kDebugMode) client.interceptors.add(DioInterceptors.logging);
    client.interceptors.add(DioInterceptors.errorHandler);
    return client;
  }

  Future<T> get<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Map<String, dynamic>? queryParameters,
  }) => _request('GET', url, parser: parser, queryParameters: queryParameters);

  Future<T> post<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) => _request(
    'POST',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
  );

  Future<T> put<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) => _request(
    'PUT',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
  );

  Future<T> patch<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) => _request(
    'PATCH',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
  );

  Future<T> delete<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) => _request(
    'DELETE',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
  );

  Future<T> _request<T>(
    String method,
    String url, {
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.request<Object?>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(method: method),
    );
    final responseData = response.data;
    if (responseData is Map<String, dynamic>) return parser(responseData);
    return parser(<String, dynamic>{});
  }
}
