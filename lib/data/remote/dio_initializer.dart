import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'environment.dart';
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
    client.interceptors.add(DioInterceptors.errorHandler);
    return client;
  }

  Future<T> get<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) => _request(
    'GET',
    url,
    parser: parser,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
  );

  Future<T> post<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) => _request(
    'POST',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
  );

  Future<T> put<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) => _request(
    'PUT',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
  );

  Future<T> patch<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) => _request(
    'PATCH',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
  );

  Future<T> delete<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) => _request(
    'DELETE',
    url,
    parser: parser,
    data: data,
    queryParameters: queryParameters,
    headers: headers,
    cancelToken: cancelToken,
  );

  Future<T> _request<T>(
    String method,
    String url, {
    required T Function(Map<String, dynamic>) parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    final options = await DioOptionsBuilder.build(headers: headers);
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
  }
}
