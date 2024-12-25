import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constant/titlePage/title_page.dart';
import 'item_menu.dart';

class AdminMenu extends StatelessWidget {
  final String username;
  const AdminMenu({super.key, required this.username});

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
                '$username (Admin)',
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
              icon: Icons.list,
              title: titlePage['dotdangkiPage'],
              pathRoute: '/dotdangkiPage',
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/dotdangkiPage');
            },
          ),
          InkWell(
            splashColor: Colors.grey.shade300,
            child: ItemMenu(
                icon: Icons.list_alt,
                title: titlePage['hosodangkiPage'],
                pathRoute: '/hosodangkiPage'),
            onTap: () {
              Navigator.pop(context);
              context.go('/hosodangkiPage');
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

          ExpansionTile(
            childrenPadding: const EdgeInsets.only(left: 40, right: 20),
            leading: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Icon(
                Icons.view_list_rounded,
                color: currentRoute.startsWith('/danhmucPage')
                    ? Colors.blue
                    : Colors.black.withOpacity(0.7),
                size: 25,
              ),
            ),
            title: Text(
              'Danh mục',
              style: TextStyle(
                color: currentRoute.startsWith('/danhmucPage')
                    ? Colors.blue
                    : Colors.black,
                fontSize: 16,
              ),
            ),
            iconColor: Colors.blue,
            children: [
              ListTile(
                selectedColor: Colors.blue,
                // selected: true,
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text('Cở sở',
                    style: TextStyle(
                        color: currentRoute.startsWith('/danhmucPage/cosoPage')
                            ? Colors.blue
                            : Colors.black)),
                onTap: () {
                  // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const CosoPage()),ModalRoute.withName('/'));
                  context.go('/danhmucPage/cosoPage');
                  // context.canPop();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text('Khoa',
                    style: TextStyle(
                        color: currentRoute.startsWith('/danhmucPage/khoaPage')
                            ? Colors.blue
                            : Colors.black)),
                onTap: () {
                  context.go('/danhmucPage/khoaPage');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text('Ngành',
                    style: TextStyle(
                        color: currentRoute.startsWith('/danhmucPage/nganhPage')
                            ? Colors.blue
                            : Colors.black)),
                onTap: () {
                  context.go('/danhmucPage/nganhPage');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text('Tổ hợp xét tuyển',
                    style: TextStyle(
                        color: currentRoute
                                .startsWith('/danhmucPage/tohopxettuyenPage')
                            ? Colors.blue
                            : Colors.black)),
                onTap: () {
                  context.go('/danhmucPage/tohopxettuyenPage');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text('Kinh phí nhập học',
                    style: TextStyle(
                        color: currentRoute
                                .startsWith('/danhmucPage/kinhphinhaphocPage')
                            ? Colors.blue
                            : Colors.black)),
                onTap: () {
                  context.go('/danhmucPage/kinhphinhaphocPage');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text('Đối tượng',
                    style: TextStyle(
                        color:
                            currentRoute.startsWith('/danhmucPage/doituongPage')
                                ? Colors.blue
                                : Colors.black)),
                onTap: () {
                  context.go('/danhmucPage/doituongPage');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text('Hệ đào tạo',
                    style: TextStyle(
                        color:
                            currentRoute.startsWith('/danhmucPage/hedaotaoPage')
                                ? Colors.blue
                                : Colors.black)),
                onTap: () {
                  context.go('/danhmucPage/hedaotaoPage');
                  Navigator.pop(context);
                },
              ),
            ],
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
          // Text(,
          //           style: TextStyle(
          //               color:
          //                   currentRoute.startsWith('/danhmucPage/hedaotaoPage')
          //                       ? Colors.blue
          //                       : Colors.black))
        ],
      ),
    );
  }
}
