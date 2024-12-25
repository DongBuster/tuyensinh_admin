import 'dart:async';
import 'package:dkxt_admin/data/models/dotdangki_model.dart';
import 'package:dkxt_admin/data/models/hedaotao_model.dart';
import 'package:dkxt_admin/data/repositories/dotdangki_page_repo.dart';
import 'package:dkxt_admin/pages/dotdangkiPage/widgets/list_dotdangki_table_foruser.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logicUI/dotdangki_logic_ui.dart';
import 'widgets/list_dotdangki_table_foradmin.dart';

class DotdangkiPage extends StatefulWidget {
  const DotdangkiPage({super.key});

  @override
  State<DotdangkiPage> createState() => _DotdangkiPageState();
}

class _DotdangkiPageState extends State<DotdangkiPage> {
  Timer? _timer;
  bool _isLoadingExceeded = false;
  Future<dynamic>? _future;
  DotdangkiPageRepo dotdangkiPageRepo = DotdangkiPageRepo();
  int roleId = -1;

  @override
  void initState() {
    fetchRoleId();
    _future = DotdangkiLogicUi.fetchListData();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> fetchRoleId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      roleId = prefs.getInt('roleId') ?? -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (GoRouterState.of(context).uri.toString() == '/dotdangkiPage') {
      _future = DotdangkiLogicUi.fetchListData();
    }
    return RefreshIndicator(
      displacement: 5,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      strokeWidth: 3,
      color: Colors.blue,
      onRefresh: () async {
        setState(() {
          _future = DotdangkiLogicUi.fetchListData();
        });
      },
      child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          // print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            _timer ??= Timer(const Duration(seconds: 10), () {
              Fluttertoast.showToast(
                msg: "Time exceed, Please check your Internet or Refesh page",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
              );
              setState(() {
                _isLoadingExceeded = true;
                _timer!.cancel();
              });
              return;
            });

            if (!_isLoadingExceeded) {
              // Hiển thị loading trong 10 giây đầu
              return Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.blue,
                  size: 50,
                ),
              );
            }
          }
          if (snapshot.hasData && snapshot.data != null) {
            _timer?.cancel();
            _timer = null;

            List<DotDangKiModel> listDotdangki = snapshot.data[0];
            List<HeDaoTaoModel> listHedaotao = snapshot.data[1];

            return roleId == 1
                ? ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.fromLTRB(0, 10, 8, 5),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                            fixedSize: WidgetStatePropertyAll(Size(125, 40)),
                          ),
                          onPressed: () {
                            context.go(
                              '/dotdangkiPage/addDotdangkiScreen',
                              extra: {'listHedaotao': listHedaotao},
                            );
                          },
                          child: const Text(
                            "Thêm mới",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      ListDotdangkiTableForAdmin(
                        listDotDangki: listDotdangki,
                        listHedaotao: listHedaotao,
                      )
                    ],
                  )
                : ListView(
                    shrinkWrap: true,
                    children: [
                      ListDotdangkiTableForUser(
                        listDotDangki: listDotdangki,
                        listHedaotao: listHedaotao,
                      )
                    ],
                  );
          }
          if (snapshot.hasError || _isLoadingExceeded) {
            // Hiển thị giao diện khi vượt quá thời gian tải hoặc gặp lỗi
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Failed to load data. Please refresh.",
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isLoadingExceeded = false;
                        _timer = null;
                        _future = DotdangkiLogicUi.fetchListData();
                      });
                    },
                    child: const Text("Refresh"),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
