import 'package:template_flutter/data/remote/api_response.dart';

extension ApiResponseExtension<T> on Future<ApiResponse<T>> {
  Future<T> get validateResponse async {
    final response = await this;
    if (response.status == true) {
      return response.data as T;
    } else {
      throw response.message;
    }
  }
}

extension ApiResponseListExtension<T> on Future<ApiResponseList<T>> {
  Future<List<T>> get validateResponse async {
    final response = await this;
    if (response.status == true) {
      return response.data ?? [];
    } else {
      throw response.message;
    }
  }
}
