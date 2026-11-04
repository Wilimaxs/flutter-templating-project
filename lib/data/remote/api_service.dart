import 'package:dio/dio.dart';
import 'package:template_flutter/model/login_response.dart';

import 'api_response.dart';
import 'dio_initializer.dart';

class ApiService {
  ApiService(this._dio);

  final DioInitializer _dio;

  /// Sends the public login request.
  Future<ApiResponse<LoginResponse>> login({
    required String email,
    required String password,
    CancelToken? cancelToken,
  }) {
    return _dio.post(
      url: '/login.php',
      data: {'email': email, 'password': password},
      cancelToken: cancelToken,
      parser: (json) => ApiResponse<LoginResponse>.fromJson(
        json,
        fromJsonT: LoginResponse.fromJson,
      ),
    );
  }
}
