
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

import 'api_url.dart';

class ApiConfigRest {
  final Dio _dio;
  final bool enableLog;

  final Map<String, dynamic> _headers = {
    'Content-Type': 'application/json',
  };

  ApiConfigRest(this._dio, {this.enableLog = true}) {
    _dio.options.baseUrl = ApiURLs.baseUrl;
    _dio.options.headers = _headers;
  }

  void _traceError(DioError e) {
    String trace = '════════════════════════════════════════ \n'
        '╔╣ Dio [ERROR] info ==> \n'
        '╟ BASE_URL: ${e.requestOptions.baseUrl}\n'
        '╟ PATH: ${e.requestOptions.path}\n'
        '╟ Method: ${e.requestOptions.method}\n'
        '╟ Params: ${e.requestOptions.queryParameters}\n'
        '╟ Body: ${e.requestOptions.data}\n'
        '╟ Header: ${e.requestOptions.headers}\n'
        '╟ statusCode: ${e.response!.statusCode}\n'
        '╟ RESPONSE: ${e.response!.data} \n'
        '╟ stackTrace: ${e.stackTrace} \n'
        '╚ [END] ════════════════════════════════════════╝';
    developer.log(trace);
  }

  void _networkLog(Response response) {
    String trace = '════════════════════════════════════════ \n'
        '╔╣ Dio [RESPONSE] info ==> \n'
        '╟ BASE_URL: ${response.requestOptions.baseUrl}\n'
        '╟ PATH: ${response.requestOptions.path}\n'
        '╟ Method: ${response.requestOptions.method}\n'
        '╟ Params: ${response.requestOptions.queryParameters}\n'
        '╟ Body: ${response.requestOptions.data}\n'
        '╟ Header: ${response.requestOptions.headers}\n'
        '╟ statusCode: ${response.statusCode}\n'
        '╟ RESPONSE: ${response.data} \n'
        '╚ [END] ════════════════════════════════════════╝';
    developer.log(trace);
  }
}
