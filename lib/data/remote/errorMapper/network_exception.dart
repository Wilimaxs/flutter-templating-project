sealed class NetworkException implements Exception {
  const NetworkException(this.message);

  final String message;

  @override
  String toString() => message;
}

final class RequestCancelled extends NetworkException {
  const RequestCancelled() : super('Request cancelled.');
}

final class UnauthorisedRequest extends NetworkException {
  const UnauthorisedRequest([super.message = 'Session expired. Please log in again.']);
}

final class ForbiddenRequest extends NetworkException {
  const ForbiddenRequest() : super('You do not have access.');
}

final class BadRequest extends NetworkException {
  const BadRequest() : super('Request is invalid.');
}

final class NotFound extends NetworkException {
  const NotFound() : super('Data not found.');
}

final class MethodNotAllowed extends NetworkException {
  const MethodNotAllowed() : super('HTTP method is not allowed.');
}

final class UnprocessableRequest extends NetworkException {
  const UnprocessableRequest() : super('The submitted data is invalid.');
}

final class TooManyRequests extends NetworkException {
  const TooManyRequests() : super('Too many requests. Please try again later.');
}

final class RequestTimeout extends NetworkException {
  const RequestTimeout() : super('Connection to the server timed out.');
}

final class SendTimeout extends NetworkException {
  const SendTimeout() : super('Sending data to the server timed out.');
}

final class ReceiveTimeout extends NetworkException {
  const ReceiveTimeout() : super('Receiving data from the server timed out.');
}

final class NoInternetConnection extends NetworkException {
  const NoInternetConnection() : super('Internet connection is unavailable.');
}

final class InternalServerError extends NetworkException {
  const InternalServerError() : super('The server encountered an error.');
}

final class InvalidResponseFormat extends NetworkException {
  const InvalidResponseFormat() : super('The server response has an invalid format.');
}

final class DefaultNetworkException extends NetworkException {
  const DefaultNetworkException(super.message);
}
