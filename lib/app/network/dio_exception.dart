import 'package:dio/dio.dart';

/// DioExceptions
class DioExceptions implements Exception {
  /// fromDioError
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
      case DioExceptionType.connectionError:
        message = 'Connection Error';
      case DioExceptionType.unknown:
        if ('${dioError.message}'.contains('SocketException')) {
          message = 'No Network Connection';
          break;
        }
        message = 'Unexpected error occurred';
    }
  }
  /// message
  late String message;

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error != null
            ? error is Map<String, dynamic> && error.containsKey('message')
            ? '${error['message']}' : '$error'
            : 'Not Found';
      case 422:
        return 'The given data was invalid.';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
