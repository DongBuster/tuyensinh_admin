import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constant/titlePage/title_page.dart';
import 'item_menu.dart';

class DefaultMenu extends StatelessWidget {
  const DefaultMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 60,
            child: DrawerHeader(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Tuyển sinh - Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, bottom: 5),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          // button go route
          InkWell(
            splashColor: Colors.grey.shade300,
            child: ItemMenu(
                icon: Icons.dashboard,
                title: titlePage['dashboard'],
                pathRoute: '/dashboard'),
            onTap: () {
              Navigator.pop(context);
              context.go('/dashboard');
            },
          ),
        ],
      ),
    );
  }
}
