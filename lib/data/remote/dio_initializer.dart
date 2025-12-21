import 'package:dio/dio.dart';
import 'package:ppob_koperasi_payment/data/remote/interceptors/dio_options_builder.dart';
import 'interceptors/dio_interceptors.dart';

class DioInitializer {
  Dio? _dio;

  Dio get dio {
    _dio ??= _initDio();
    return _dio!;
  }

  Dio _initDio() {
    final dioInstance = Dio(
      BaseOptions(
        baseUrl: 'https://your-api-base-url.com',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dioInstance.interceptors.addAll([
      DioInterceptors.logging,
      DioInterceptors.errorHandler,
    ]);

    return dioInstance;
  }

  Future<T> get<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final options = await DioOptionsBuilder.build();
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      final data = response.data;
      if (data is Map<String, dynamic>) {
        return parser(data);
      }
      return parser({});
    } catch (e) {
      rethrow;
    }
  }

  Future<T> post<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final options = await DioOptionsBuilder.build();
      final response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      final responseData = response.data;
      if (responseData is Map<String, dynamic>) {
        return parser(responseData);
      }
      return parser({});
    } catch (e) {
      rethrow;
    }
  }
}
