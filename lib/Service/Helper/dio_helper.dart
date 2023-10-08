// ignore_for_file: no_leading_underscores_for_local_identifiers, deprecated_member_use
import 'dart:io';
// import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import '../../Core/Core_Config/config_result.dart';
import '../../Core/Core_Config/config_url.dart';

class DioHelper {
  String? url;
  bool? isHttps;
  late Dio _dio;

  DioHelper() {
    client();
  }

  void client() async {
    _dio = Dio();
    _dio.options.connectTimeout = const Duration(seconds: 7);
    _dio.options.receiveTimeout = const Duration(seconds: 7);
    _dio.options.sendTimeout = const Duration(seconds: 7);
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.baseUrl = ConfigUrl.BASE_URL;
    _dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    _dio.options.headers['Accept'] = 'application/json; charset=UTF-8';
    _dio.options.headers.addAll({
      "Connection": "Keep-Alive",
    });
    if (kDebugMode) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    if (!kIsWeb) {
      (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
  }

  Future<Result> getAsync({@required searchKeyWord}) async {
    Response response;
    try {
      Dio tempDio = _dio;
      response = await tempDio.get("${ConfigUrl.search}$searchKeyWord");
      return Result.success(data: response.data);
    } on DioException catch (e) {
      debugPrint("I got error $e");
      return Result.error(e.response?.data.toString(),
          errorCode: e.response?.data['code'].toString(), result: e);
    } catch (e, trace) {
      debugPrint(trace.toString());
      debugPrint(e.toString());
      return Result.error(e.toString());
    }
  }
}
