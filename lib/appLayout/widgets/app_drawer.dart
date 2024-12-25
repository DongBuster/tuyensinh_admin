import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin_menu.dart';
import 'board_menu.dart';
import 'default_menu.dart';
import 'faculty_menu.dart';
import 'finnace_menu.dart';
import 'staff_menu.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int roleId = -1;
  String userName = '';

  Future<void> fetchRoleId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      roleId = prefs.getInt('roleId') ?? -1;
    });
  }

  Future<void> fetchUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString('username') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRoleId();
    fetchUserName();
  }

  @override
  Widget build(BuildContext context) {
    // print(GoRouterState.of(context).uri.toString());
    return buildMenuBasedOnRole(roleId, userName);
  }
}

Widget buildMenuBasedOnRole(int roleId, String userName) {
  switch (roleId) {
    case 1:
      return AdminMenu(username: userName);
    case 2:
      return StaffMenu(username: userName);
    case 3:
      return BoardMenu(username: userName);
    case 4:
      return FacultyMenu(username: userName);
    case 5:
      return FinnaceMenu(username: userName);
    default:
      return const DefaultMenu();
  }
}
