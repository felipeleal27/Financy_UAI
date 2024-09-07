import 'package:gestao_financeira/app/service/rest_client/exceptions/rest_client_response.dart';

class RestClienteException implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  RestClientResponse response;

  RestClienteException({
    this.message,
    this.statusCode,
    required this.error,
    required this.response,
  });

  @override
  String toString() {
    return 'RestClienteException(message: $message, statusCode: $statusCode, error: $error, response: $response)';
  }
}
