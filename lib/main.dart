import 'dart:async';

import 'package:dkxt_admin/pages/hosodangkiPage/hosodangki_page.dart';
import 'package:dkxt_admin/pages/trangchuPage/cubit/select_menu.dart';
import 'package:dkxt_admin/pages/trangchuPage/trangchu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'pages/dotdangkiPage/cubit/list_dotdangkinghanh_model_cubit.dart';
import 'pages/dotdangkiPage/widgets/list_dotdangkinghanh_table.dart';
import 'pages/hosodangkiPage/cubits/list_hoso_duyet.dart';
import 'pages/trangchuPage/cubit/key_data.dart';
import 'routes/routes_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  // Thiết lập bắt lỗi trong Flutter framework
  FlutterError.onError = (FlutterErrorDetails details) {
    // In lỗi ra console
    FlutterError.dumpErrorToConsole(details);

    // Hiển thị toast
    // showToast("Something went wrong !, Please try again or Restart app");
  };
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

// Hàm hiển thị toast
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final connectionChecker = InternetConnectionChecker.instance;
  late StreamSubscription<InternetConnectionStatus> subscription;
  @override
  void initState() {
    initialization();
    subscription = connectionChecker.onStatusChange.listen(
      (InternetConnectionStatus status) {
        if (status == InternetConnectionStatus.connected) {
          print('Connected to the internet');
        } else {
          print('Disconnected from the internet');
        }
      },
    );
    super.initState();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    subscription.cancel();
    connectionChecker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => KeyDataCubit(),
          child: const Dashboard(),
        ),
        BlocProvider(
          create: (context) => NameSelectMenuCubit(),
          child: const Dashboard(),
        ),
        BlocProvider(
          create: (context) => ListDotdangkinghanhModelCubit(),
          child: ListDotdangkiNghanhTable(listDotDangkiNganh: const []),
        ),
        BlocProvider(
          create: (context) => ListHosoDuyetCubit(),
          child: const HosodangkiPage(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routerConfig,
      ),
    );
  }
}
