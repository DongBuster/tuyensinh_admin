import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRepo {
  Future<int> fetchRoleId(String accessToken) async {
    Dio dio = Dio();
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://srv01.hitgroup.vn:2001/admin/api/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
    var response = await dio.post(
      'taikhoans/me',
      options: Options(headers: {'accesstoken': accessToken}),
    );
    int roleId = -1;
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      roleId = response.data['roleId'] as int;
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('username', response.data['username']);
    }

    return roleId;
  }
}
