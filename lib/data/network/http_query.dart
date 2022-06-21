import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:yoko_test_task/data/storage/secured_storage.dart';

class Http {
  var dio = Dio();
  String backendURL = 'https://api.shymbulak-dev.com/';

  PrettyDioLogger logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 100,
  );

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headerData,
  }) async {
    dio.interceptors.add(logger);
    Map<String, dynamic> header = {};
    String? token = await securedStorage.getAuthToken();
    if (token != null) header.addAll({"Authorization": 'Bearer $token'});
    if (headerData != null) header.addAll(headerData);
    var result = await dio.get(
      backendURL + url,
      options: Options(
        sendTimeout: 30000,
        receiveTimeout: 30000,
        headers: header,
      ),
      queryParameters: queryParameters,
    );
    return result.data;
  }

  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  }) async {
    dio.interceptors.add(logger);
    Map<String, dynamic> header = {
      "Accept": "application/json",
    };
    String? token = await securedStorage.getAuthToken();
    if (token != null) header.addAll({"Authorization": 'Bearer $token'});
    if (headerData != null) header.addAll(headerData);
    var result = await dio.post(
      backendURL + url,
      options: Options(
        method: 'POST',
        // contentType: contentType,
        sendTimeout: 30000,
        receiveTimeout: 30000,
        headers: header,
      ),
      queryParameters: queryParameters,
      data: data,
    );
    return result.data;
  }

  Future<dynamic> put({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  }) async {
    dio.interceptors.add(logger);
    Map<String, dynamic> header = {
      "Content-Type": "application/json",
    };
    String? token = await securedStorage.getAuthToken();
    if (token != null) header.addAll({"Authorization": 'Bearer $token'});
    if (headerData != null) header.addAll(headerData);
    var result = await dio.put(
      backendURL + url,
      options: Options(
        sendTimeout: 30000,
        receiveTimeout: 30000,
        headers: header,
      ),
      queryParameters: queryParameters,
      data: data,
    );
    return result.data;
  }

  Future<dynamic> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headerData,
  }) async {
    dio.interceptors.add(logger);
    Map<String, dynamic> header = {
      "Content-Type": "application/json",
    };
    String? token = await securedStorage.getAuthToken();
    if (token != null) header.addAll({"Authorization":'Bearer $token'});
    if (headerData != null) header.addAll(headerData);
    var result = await dio.delete(
      backendURL + url,
      options: Options(
        headers: header,
      ),
      queryParameters: queryParameters,
      data: data,
    );
    return result.data;
  }
}
