import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

/// DioClient
class DioClient {
  /// Constructor
  DioClient() {
    _dio = Dio();
    _dio
      ..options.baseUrl = ''
      // ..options.connectTimeout = Endpoints.connectionTimeout
      // ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {
        'Content-type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
      }
      ..options.responseType = ResponseType.json;

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          queryParameters: true,
          requestBody: true,
          responseHeader: true,
          showProcessingTime: false,
          canShowLog: true,
        ),
      );
    }
  }

  late final Dio _dio;

  /// getDio
  Dio get getDio => _dio;
}
