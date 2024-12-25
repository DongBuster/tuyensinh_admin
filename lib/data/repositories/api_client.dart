import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/routes_config.dart';
import 'package:go_router/go_router.dart';

class ApiClient {
  late Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String accessToken = await getAccessToken();
        options.headers['accesstoken'] = accessToken;

        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          showTimeoutToast();
          return handler.next(error);
        } else if (error.response?.statusCode == 401) {
          String accsessToken = await getNewToken();
          error.requestOptions.headers['accesstoken'] = accsessToken;
          final cloneRequest = await dio.request(error.requestOptions.path,
              options: Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers,
              ));

          return handler.resolve(cloneRequest);
        }
        if (error.response!.statusCode! >= 400 &&
            error.response!.statusCode! < 500) {}

        return handler.next(error);
      },
    ));
  }

  Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accessToken');
    return accessToken ?? '';
  }

  Future<String> getNewToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? refreshToken = prefs.getString('refreshToken');
    Response response = await dio.post(
        'http://srv01.hitgroup.vn:2001/admin/api/taikhoans/token',
        options: Options(headers: {'refreshToken': '$refreshToken'}));
    // refreshToken đã hết hạn
    if (response.statusCode == 401) {
      navigatorKey.currentState?.pushReplacementNamed('/loginPage');
    }
    prefs.setString('accessToken', response.data['accessToken'].toString());
    return response.data['accessToken'].toString();
  }

  Future<Response> getData(String path) async {
    Response response = await dio.get(path);
    if (response.data is Map<String, dynamic> &&
        response.data['message'] ==
            'Mã access token không đúng hoặc đã hết hạn') {
      final keyContext = navigatorKey.currentContext;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('logined', false);
      prefs.setString('accessToken', '');
      prefs.setString('refreshToken', '');
      keyContext?.pushReplacement('/loginPage');
    }
    return response;
  }

  void showTimeoutToast() {
    Fluttertoast.showToast(
      msg: "Request timeout. Please check your internet and restart app.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      timeInSecForIosWeb: 5,
    );
  }

  void showAccessTokenTimeoutToast() {
    Fluttertoast.showToast(
      msg: "Phiên đăng nhập đã hết hạn",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      timeInSecForIosWeb: 5,
    );
  }
}
