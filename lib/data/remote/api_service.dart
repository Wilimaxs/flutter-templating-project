import 'api_response.dart';
import 'dio_initializer.dart';

class ApiService {
  final DioInitializer _dio;

  ApiService(this._dio);

  // Example login method that fetches data from an endpoint
  Future<ApiResponse<T>> login<T>({
    required String endpoint,
    required T Function(Map<String, dynamic>) parser,
  }) async {
    return await _dio.get(
      url: endpoint,
      parser: (json) => ApiResponse<T>.fromJson(json, parser),
    );
  }
}
