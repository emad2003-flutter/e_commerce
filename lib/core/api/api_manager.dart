import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_constants.dart';

class ApiManager {
   final dio = Dio();

   getData({required String endPoint, Map<String, dynamic>? query}) {
    dio.get(ApiConstants.baseUrl + endPoint, queryParameters: query);
  }

    postData({required String endPoint, Map<String, dynamic>? query, Object? data}) {
    dio.post(ApiConstants.baseUrl + endPoint, queryParameters: query, data: data);
  }
}
