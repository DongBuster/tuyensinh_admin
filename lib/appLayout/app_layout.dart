import 'package:dkxt_admin/constant/titlePage/title_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/app_drawer.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    String currentRoute = GoRouterState.of(context).uri.toString().substring(1);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              titlePage[currentRoute],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.setBool('logined', false);
                prefs.setString('accessToken', '');
                prefs.setString('refreshToken', '');
                if (context.mounted) {
                  context.go('/loginPage');
                }
              },
              icon: const Icon(
                Icons.logout_rounded,
                size: 25,
                color: Colors.white,
              ),
            ),
          ],
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 22,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
        ),
        body: child,
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const AppDrawer(),
        ),
      ),
    );
  }
}
