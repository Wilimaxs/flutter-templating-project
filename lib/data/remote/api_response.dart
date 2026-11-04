/// Common fields returned by the API response envelope.
class BaseResponse<T> {
  final bool status;
  final String message;
  final T? data;

  const BaseResponse({
    required this.status,
    required this.message,
    this.data,
  });
}

/// Parses an API response whose `data` field is a JSON object.
class ApiResponse<T> extends BaseResponse<T> {
  const ApiResponse({
    required super.status,
    required super.message,
    super.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json, {
    required T Function(Map<String, dynamic> json) fromJsonT,
  }) {
    final rawStatus = json['status'];
    if (rawStatus is! bool) {
      throw const FormatException('API response field "status" must be bool.');
    }

    final rawData = json['data'];
    final parsedData = rawData == null
        ? null
        : rawData is Map<String, dynamic>
        ? fromJsonT(rawData)
        : throw const FormatException(
            'API response field "data" must be a JSON object.',
          );

    return ApiResponse<T>(
      status: rawStatus,
      message: json['message']?.toString() ?? '',
      data: parsedData,
    );
  }
}

/// Parses an API response whose `data` field is a JSON array.
class ApiResponseList<T> extends BaseResponse<List<T>> {
  const ApiResponseList({
    required super.status,
    required super.message,
    super.data,
  });

  factory ApiResponseList.fromJson(
    Map<String, dynamic> json, {
    required T Function(Map<String, dynamic> json) fromJsonT,
  }) {
    final rawStatus = json['status'];
    if (rawStatus is! bool) {
      throw const FormatException('API response field "status" must be bool.');
    }

    final rawData = json['data'];
    final parsedData = rawData == null
        ? null
        : rawData is List
        ? rawData.map((item) {
            if (item is! Map<String, dynamic>) {
              throw const FormatException(
                'Every item in API response field "data" must be a JSON object.',
              );
            }
            return fromJsonT(item);
          }).toList()
        : throw const FormatException(
            'API response field "data" must be a JSON array.',
          );

    return ApiResponseList<T>(
      status: rawStatus,
      message: json['message']?.toString() ?? '',
      data: parsedData,
    );
  }
}
