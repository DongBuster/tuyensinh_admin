import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../appLayout/app_layout.dart';
import '../pages/auth/login_page.dart';
import '../pages/bangkePage/childPage/bangke_kinhphinh.dart';
import '../pages/bangkePage/childPage/bangke_lephinh.dart';
import '../pages/bangkePage/childPage/bangke_nhtheonganh.dart';
import '../pages/danhmucPage/childPages/coso_page.dart';
import '../pages/danhmucPage/childPages/doituong_page.dart';
import '../pages/danhmucPage/childPages/hedaotao_page.dart';
import '../pages/danhmucPage/childPages/khoa_page.dart';
import '../pages/danhmucPage/childPages/kinhphi_nhaphoc_page.dart';
import '../pages/danhmucPage/childPages/nganh_page.dart';
import '../pages/danhmucPage/childPages/tohop_xettuyen_page.dart';
import '../pages/dotdangkiPage/screens/add_dotdangki_screen.dart';
import '../pages/dotdangkiPage/screens/edit_dotdangki_screen.dart';
import '../pages/dotdangkiPage/screens/select_nganhdangki_screen.dart';
import '../pages/hosonhaphocPage/hosonhaphoc_page.dart';
import '../pages/hosotrungtuyenPage/hosotrungtuyen_page.dart';
import '../pages/trangchuPage/trangchu_page.dart';
import '../pages/hosodangkiPage/hosodangki_page.dart';
import '../pages/dotdangkiPage/dotdangki_page.dart';
import '../pages/xettuyenPage/xettuyen_page.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'navigator');

final GoRouter routerConfig = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/loginPage',
  errorPageBuilder: (context, state) {
    return buildPageWithNoDefaultTransition(
      context: context,
      state: state,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 60,
              color: Colors.yellow,
            ),
            const SizedBox(height: 10),
            const Text(
              'Oops!',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.none,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Something wrong happened!',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.none,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                fixedSize: WidgetStatePropertyAll(Size(125, 40)),
              ),
              onPressed: () {
                context.go('/dashboard');
              },
              child: const Text(
                "Go Home",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  },
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return AppLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          pageBuilder: (context, state) {
            return buildPageWithNoDefaultTransition(
              context: context,
              state: state,
              child: const Dashboard(),
            );
          },
        ),
        GoRoute(
            path: '/dotdangkiPage',
            pageBuilder: (context, state) {
              return buildPageWithNoDefaultTransition(
                context: context,
                state: state,
                child: const DotdangkiPage(),
              );
            },
            routes: [
              GoRoute(
                path: 'addDotdangkiScreen',
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;

                  return buildPageWithTransition(
                    context: context,
                    state: state,
                    child: AddDotdangkiScreen(
                      listHedaotaos: extra?['listHedaotao'] ?? '',
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'editDotdangkiScreen',
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;

                  return buildPageWithTransition(
                    context: context,
                    state: state,
                    child: EditDotdangkiScreen(
                      title: extra?['title'] ?? '',
                      listHedaotaos: extra?['listHedaotao'] ?? '',
                      dotDangKiModel: extra?['dotdangkimodel'],
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'selectNganhdangkiScreen',
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  return buildPageWithTransition(
                    context: context,
                    state: state,
                    child: SelectNganhdangkiScreen(
                      dotDangKyId: extra?['dotDangKyId'] ?? '',
                      title: extra?['title'] ?? '',
                    ),
                  );
                },
              ),
            ]),
        GoRoute(
          path: '/hosodangkiPage',
          pageBuilder: (context, state) {
            return buildPageWithNoDefaultTransition(
              context: context,
              state: state,
              child: const HosodangkiPage(),
            );
          },
        ),
        GoRoute(
          path: '/xettuyenPage',
          pageBuilder: (context, state) {
            return buildPageWithNoDefaultTransition(
              context: context,
              state: state,
              child: const XettuyenPage(),
            );
          },
        ),
        GoRoute(
          path: '/hosotrungtuyenPage',
          pageBuilder: (context, state) {
            return buildPageWithNoDefaultTransition(
              context: context,
              state: state,
              child: const HosotrungtuyenPage(),
            );
          },
        ),
        GoRoute(
          path: '/hosonhaphocPage',
          pageBuilder: (context, state) {
            return buildPageWithNoDefaultTransition(
              context: context,
              state: state,
              child: const HoSoNhapHocPage(),
            );
          },
        ),

        // danh muc
        GoRoute(
          path: '/danhmucPage',
          pageBuilder: (context, state) {
            return buildPageWithNoDefaultTransition(
                context: context, state: state, child: const SizedBox());
          },
          routes: [
            GoRoute(
              path: 'cosoPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child: const PopScope(canPop: false, child: CosoPage()),
                );
              },
            ),
            GoRoute(
              path: 'doituongPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child: const PopScope(canPop: false, child: DoiTuongPage()),
                );
              },
            ),
            GoRoute(
              path: 'hedaotaoPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child: const PopScope(canPop: false, child: HedaotaoPage()),
                );
              },
            ),
            GoRoute(
              path: 'khoaPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child: const PopScope(canPop: false, child: KhoaPage()),
                );
              },
            ),
            GoRoute(
              path: 'kinhphinhaphocPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child: const PopScope(
                      canPop: false, child: KinhphiNhaphocPage()),
                );
              },
            ),
            GoRoute(
              path: 'nganhPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child: const PopScope(canPop: false, child: NganhPage()),
                );
              },
            ),
            GoRoute(
              path: 'tohopxettuyenPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child:
                      const PopScope(canPop: false, child: TohopXettuyenPage()),
                );
              },
            ),
          ],
        ),
        // list bang ke
        GoRoute(
          path: '/bangkePage',
          pageBuilder: (context, state) {
            return buildPageWithNoDefaultTransition(
              context: context,
              state: state,
              child: const SizedBox(),
            );
          },
          routes: [
            GoRoute(
              path: 'kinhphinhaphocPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child: const PopScope(
                      canPop: false, child: BangkeKinhphinhPage()),
                );
              },
            ),
            GoRoute(
              path: 'lephinhaphocPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child:
                      const PopScope(canPop: false, child: BangkeLephinhPage()),
                );
              },
            ),
            GoRoute(
              path: 'nhaphoctheonganhPage',
              pageBuilder: (context, state) {
                return buildPageWithNoDefaultTransition(
                  context: context,
                  state: state,
                  child: const PopScope(
                      canPop: false, child: BangkeNhtheonganhPage()),
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/loginPage',
      pageBuilder: (context, state) {
        return buildPageWithNoDefaultTransition(
          context: context,
          state: state,
          child: const LoginPage(),
        );
      },
      redirect: (context, state) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.getBool('logined') == true) {
          var initRoute = await getRoleUser();
          return initRoute;
        } else {
          return '/loginPage';
        }
      },
    ),
  ],
);

CustomTransitionPage buildPageWithNoDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      });
}

CustomTransitionPage buildPageWithTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      transitionDuration: const Duration(milliseconds: 200),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}

Future<String> getRoleUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var roleId = prefs.getInt('roleId') ?? -1;

  switch (roleId) {
    case 2:
      return '/dotdangkiPage';

    case 5:
      return '/hosonhaphocPage';
    default:
      return '/dashboard';
  }
}
