import 'package:ppob_koperasi_payment/model/login_response.dart';

import 'api_response.dart';
import 'dio_initializer.dart';

class ApiService {
  final DioInitializer _dio;

  ApiService(this._dio);

  // Example of a specific API call method (login)
  Future<ApiResponse<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    return await _dio.post(
      url: '/auth/login',
      data: {'email': email, 'password': password},
      parser: (json) => ApiResponse<LoginResponse>.fromJson(
        json,
        (data) => LoginResponse.fromJson(data),
      ),
    );
  }

  // Example of a specific API call method (get products)
  Future<ApiResponseList<T>> getProducts<T>({
    required T Function(Map<String, dynamic>) modelParser,
  }) async {
    return await _dio.get(
      url: '/products',
      parser: (json) => ApiResponseList<T>.fromJson(json, modelParser),
    );
  }
}
