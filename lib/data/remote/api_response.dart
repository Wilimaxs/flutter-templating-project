import 'base_response.dart';

// Response API for single object
class ApiResponse<T> extends BaseResponse {
  final T? result;

  ApiResponse({required super.status, required super.message, this.result});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    final resultData = json['result'];
    return ApiResponse(
      status: json['status']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      result: (resultData is Map<String, dynamic> && fromJsonT != null)
          ? fromJsonT(resultData)
          : null,
    );
  }
}

// Response API for list of objects
class ApiResponseList<T> extends BaseResponse {
  final List<T>? result;

  ApiResponseList({required super.status, required super.message, this.result});

  factory ApiResponseList.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    final resultData = json['result'];
    return ApiResponseList(
      status: json['status']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      result: (resultData is List && fromJsonT != null)
          ? resultData
                .whereType<Map<String, dynamic>>()
                .map((item) => fromJsonT(item))
                .toList()
          : null,
    );
  }
}
