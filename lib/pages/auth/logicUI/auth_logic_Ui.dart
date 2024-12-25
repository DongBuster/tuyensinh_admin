import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repositories/login_page_repo.dart';

class AuthLogicUi {
  final LoginRepo loginRepo = LoginRepo();
  void handleLogin(String username, String password, BuildContext context) {
    loginRepo.login(username, password).then(
      (result) async {
        if (result == 'Wrong login information') {
          showToast(result);
        } else {
          final SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setBool('logined', true);
          if (context.mounted) {
            int roleId = prefs.getInt('roleId') ?? -1;
            switch (roleId) {
              case 2:
                context.go('/dotdangkiPage');
              case 5:
                context.go('/hosonhaphocPage');
              default:
                context.go('/dashboard');
            }
          }
        }
      },
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
