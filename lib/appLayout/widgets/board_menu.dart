import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../constant/titlePage/title_page.dart';
import 'item_menu.dart';

class BoardMenu extends StatelessWidget {
  final String username;
  const BoardMenu({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    String currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 60,
            child: DrawerHeader(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '$username (Board)',
                style: const TextStyle(
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

          ExpansionTile(
            childrenPadding: const EdgeInsets.only(left: 40, right: 20),
            leading: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Icon(
                Icons.pie_chart_outline_sharp,
                color: currentRoute.startsWith('/bangkePage')
                    ? Colors.blue
                    : Colors.black.withOpacity(0.7),
                size: 25,
              ),
            ),
            title: Text(
              'Bảng kê',
              style: TextStyle(
                color: currentRoute.startsWith('/bangkePage')
                    ? Colors.blue
                    : Colors.black,
                fontSize: 16,
              ),
            ),
            iconColor: Colors.blue,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text(
                  'Kinh phí nhập học',
                  style: TextStyle(
                      color: currentRoute
                              .startsWith('/bangkePage/kinhphinhaphocPage')
                          ? Colors.blue
                          : Colors.black),
                ),
                onTap: () {
                  context.go('/bangkePage/kinhphinhaphocPage');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text(
                  'Lệ phí nhập học',
                  style: TextStyle(
                      color: currentRoute
                              .startsWith('/bangkePage/lephinhaphocPage')
                          ? Colors.blue
                          : Colors.black),
                ),
                onTap: () {
                  context.go('/bangkePage/lephinhaphocPage');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text(
                  'Nhập học theo nghành',
                  style: TextStyle(
                      color: currentRoute
                              .startsWith('/bangkePage/nhaphoctheonganhPage')
                          ? Colors.blue
                          : Colors.black),
                ),
                onTap: () {
                  context.go('/bangkePage/nhaphoctheonganhPage');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
