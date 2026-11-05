/// Common fields returned by the API response envelope.
class BaseResponse {
  final bool status;
  final String message;

  const BaseResponse({required this.status, required this.message});
}

/// Parses an API response whose `data` field is a JSON object.
class ApiResponse<T> extends BaseResponse {
  final T? data;

  const ApiResponse({required super.status, required super.message, this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json, {
    required T Function(Map<String, dynamic> json) fromJsonT,
  }) {
    return ApiResponse<T>(
      status: json['status'],
      message: json['message'],
      data: json['data'] == null ? null : fromJsonT(json['data']),
    );
  }
}

/// Parses an API response whose `data` field is a JSON array.
class ApiResponseList<T> extends BaseResponse {
  final List<T>? data;

  const ApiResponseList({
    required super.status,
    required super.message,
    this.data,
  });

  factory ApiResponseList.fromJson(
    Map<String, dynamic> json, {
    required T Function(Map<String, dynamic> json) fromJsonT,
  }) {
    return ApiResponseList<T>(
      status: json['status'],
      message: json['message'],
      data: json['data'] == null
          ? null
          : List<T>.from(json['data'].map((e) => fromJsonT(e))),
    );
  }
}
