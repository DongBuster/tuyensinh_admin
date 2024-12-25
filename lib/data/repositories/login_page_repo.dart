import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_token_model.dart';
import 'app_repo.dart';

class LoginRepo {
  final Dio dio = Dio();
  final AppRepo appRepo = AppRepo();

  Future<String> login(String userName, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await dio
          .post('http://srv01.hitgroup.vn:2001/admin/api/taikhoans', data: {
        "userName": userName,
        "passWord": password,
      });

      UserToken userToken = UserToken.fromJson(response.data);

      final responseRoleId = await appRepo.fetchRoleId(userToken.accessToken);

      prefs.setInt('roleId', responseRoleId);
      prefs.setBool('logined', true);
      prefs.setString('accessToken', userToken.accessToken);
      prefs.setString('refreshToken', userToken.refreshToken);
      // prefs.setString('username', userToken.);

      return 'Success';
    } catch (e) {
      print(e.toString());
      return 'Wrong login information';
    }
  }
}
