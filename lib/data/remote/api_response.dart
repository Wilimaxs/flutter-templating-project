import 'base_response.dart';

// Response API for single object
class ApiResponse<T> extends BaseResponse {
  final T? data;

  ApiResponse({required super.status, required super.message, this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    final resultData = json['data'];
    return ApiResponse(
      status: json['status'],
      message: json['message']?.toString() ?? '',
      data: (resultData is Map<String, dynamic> && fromJsonT != null)
          ? fromJsonT(resultData)
          : null,
    );
  }
}

// Response API for list of objects
class ApiResponseList<T> extends BaseResponse {
  final List<T>? data;

  ApiResponseList({required super.status, required super.message, this.data});

  factory ApiResponseList.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    final resultData = json['data'];
    return ApiResponseList(
      status: json['status'],
      message: json['message']?.toString() ?? '',
      data: (resultData is List && fromJsonT != null)
          ? resultData
                .whereType<Map<String, dynamic>>()
                .map((item) => fromJsonT(item))
                .toList()
          : null,
    );
  }
}
