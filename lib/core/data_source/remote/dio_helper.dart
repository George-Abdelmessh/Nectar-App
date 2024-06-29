import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../end_points.dart';
import '../local/cache_manager.dart';

class DioHelper {
  static late Dio _dio;

  /// initialize Dio
  static Future<void> init() async {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      receiveDataWhenStatusError: true,
      followRedirects: false,
      validateStatus: (status) => status! < 500,
    ));
    _dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          requestBody: true,
          error: true,
          responseBody: true,
          requestHeader: false,
          request: false,
          responseHeader: false,
        ),
    ]);
  }

  /// Dio Get Request
  static Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    _dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheManager.getDate(key: TOKEN)}'
    };
    return _dio.get(endpoint, queryParameters: query, options: options);
  }

  /// Dio Post Request
  static Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? query,
    Options? options,
    required Map<String, dynamic> data,
    bool isFormData = true,
  }) async {
    _dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheManager.getDate(key: 'token')}'
    };
    return _dio.post(
      endpoint,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: query,
      options: options,
    );
  }

  /// Dio Put Request
  static Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? query,
    Options? options,
    required Map<String, dynamic> data,
    bool isFormData = true,
  }) async {
    _dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheManager.getDate(key: 'token')}'
    };
    return _dio.put(
      endpoint,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: query,
      options: options,
    );
  }

  /// Dio Delete Request
  static Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? query,
    Options? options,
    bool isFormData = true,
  }) async {
    _dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheManager.getDate(key: 'token')}'
    };
    return _dio.delete(endpoint, queryParameters: query, options: options);
  }
}
