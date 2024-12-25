import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constant/titlePage/title_page.dart';
import 'item_menu.dart';

class FacultyMenu extends StatelessWidget {
  final String username;

  const FacultyMenu({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
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
                '$username ',
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

          InkWell(
            splashColor: Colors.grey.shade300,
            child: ItemMenu(
                icon: Icons.list_alt,
                title: titlePage['dotdangkiPage'],
                pathRoute: '/dotdangkiPage'),
            onTap: () {
              Navigator.pop(context);
              context.go('/dotdangkiPage');
            },
          ),

          InkWell(
            splashColor: Colors.grey.shade300,
            child: ItemMenu(
                icon: Icons.content_paste_go_rounded,
                title: titlePage['xettuyenPage'],
                pathRoute: '/xettuyenPage'),
            onTap: () {
              Navigator.pop(context);
              context.go('/xettuyenPage');
            },
          ),

          InkWell(
            splashColor: Colors.grey.shade300,
            child: ItemMenu(
                icon: Icons.folder_open,
                title: titlePage['hosotrungtuyenPage'],
                pathRoute: '/hosotrungtuyenPage'),
            onTap: () {
              Navigator.pop(context);
              context.go('/hosotrungtuyenPage');
            },
          ),

          InkWell(
            splashColor: Colors.grey.shade300,
            child: ItemMenu(
                icon: Icons.list_alt,
                title: titlePage['hosonhaphocPage'],
                pathRoute: '/hosonhaphocPage'),
            onTap: () {
              Navigator.pop(context);
              context.go('/hosonhaphocPage');
            },
          ),
        ],
      ),
    );
  }
}
