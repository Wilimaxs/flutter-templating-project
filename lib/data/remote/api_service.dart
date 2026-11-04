import 'package:template_flutter/model/login_response.dart';
import 'api_response.dart';
import 'dio_initializer.dart';

class ApiService {
  ApiService(this._dio);

  final DioInitializer _dio;

/// Handle login request API
  Future<ApiResponse<LoginResponse>> login({
    required String email,
    required String password,
  }) {
    return _dio.post(
      url: '/login.php',
      data: {'email': email, 'password': password},
      parser: (json) => ApiResponse<LoginResponse>.fromJson(
        json,
        fromJsonT: LoginResponse.fromJson,
      ),
    );
  }
}
