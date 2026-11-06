import 'package:dio/dio.dart';
import 'package:template_flutter/model/explore_items_page.dart';
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
  }) => _dio.post(
    url: '/login.php',
    data: {'email': email, 'password': password},
    cancelToken: cancelToken,
    requiresAuth: false,
    parser: (json) => ApiResponse<LoginResponse>.fromJson(
      json,
      fromJsonT: LoginResponse.fromJson,
    ),
  );

  Future<ApiResponse<ExploreItemsPage>> getExploreItems({
    required int page,
    CancelToken? cancelToken,
  }) => _dio.get(
    url: '/items.php',
    queryParameters: {'page': page},
    cancelToken: cancelToken,
    parser: (json) => ApiResponse<ExploreItemsPage>.fromJson(
      json,
      fromJsonT: ExploreItemsPage.fromJson,
    ),
  );
}
