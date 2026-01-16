import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) {
    return dio.get(ApiConstants.baseUrl + endPoint, queryParameters: query);
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    Object? data,
  }) {
    return dio.post(
      ApiConstants.baseUrl + endPoint,
      queryParameters: query,
      data: data,
    );
  }
}
