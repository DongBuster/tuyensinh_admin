import 'dart:async';
import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:dkxt_admin/data/models/dashboard_model.dart';
import 'package:dkxt_admin/data/models/dotdangki_model.dart';
import 'package:dkxt_admin/data/repositories/trangchu_page_repo.dart';
import 'package:dkxt_admin/pages/trangchuPage/cubit/key_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'cubit/select_menu.dart';
import 'logicUI/trangchu_logic_ui.dart';
import 'widgets/bar_chart.dart';
import 'widgets/box_info.dart';
import 'widgets/select_menus.dart';
import 'widgets/summary_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Timer? _timer;
  bool _isLoadingExceeded = false;
  List<DotDangKiModel> _listDotDangki = [];
  Future<dynamic>? _future;
  TrangchuRepo trangchuRepo = TrangchuRepo();
  int roleId = -1;

  @override
  void initState() {
    trangchuRepo.fetchDataDotDangkis().then((value) {
      _listDotDangki = value;
    });
    fetchRoleId();
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

  Future<dynamic> _fetchAllData(String keyDataDashboard) async {
    var dataListDotDangki = await trangchuRepo.fetchDataDotDangkis();
    var dataDashboard = await trangchuRepo.fetchDataDashboard(keyDataDashboard);
    if (_listDotDangki != dataListDotDangki) {
      _listDotDangki = dataListDotDangki;
    }
    return dataDashboard;
  }

  @override
  Widget build(BuildContext context) {
    String keyData = context.watch<KeyDataCubit>().state;
    _future = _fetchAllData(keyData);
    return RefreshIndicator(
      displacement: 5,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      strokeWidth: 3,
      color: Colors.blue,
      onRefresh: () async {
        context.read<KeyDataCubit>().setKeyData('0');
        context
            .read<NameSelectMenuCubit>()
            .setKeyData('Tất cả các đợt đăng kí');
        setState(() {});
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

            // print(snapshot.data);

            final DashboardModel data = snapshot.data;

            return Scrollbar(
              thickness: 9,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectMenus(listDotDangki: _listDotDangki),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blue.shade400),
                        ),
                        onPressed: () async {
                          await TrangchuLogicUi.requestStoragePermission(data)
                              .then((filePath) => Fluttertoast.showToast(
                                    msg:
                                        "Export file excel successfully \n Location: $filePath",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                  ));
                        },
                        child: const Text(
                          'Export',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.grey.shade300,
                        onTap: () {
                          if (roleId == 1) {
                            context.go('/hosodangkiPage');
                          } else {
                            GlobalFunction.alertMessage(
                                'You do not have permission to view!',
                                'warning');
                          }
                        },
                        child: BoxInfo(
                          name: 'Nguyện vọng',
                          number: '${data.thongTinChung!.countNguyenVong}',
                          icon: Icons.person,
                          color: Colors.teal,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.grey.shade300,
                        onTap: () {
                          if (roleId == 1) {
                            context.go('/hosodangkiPage');
                          } else {
                            GlobalFunction.alertMessage(
                                'You do not have permission to view!',
                                'warning');
                          }
                        },
                        child: BoxInfo(
                          name: 'Hồ sơ đăng kí',
                          number: '${data.thongTinChung!.countThiSinh}',
                          icon: Icons.list_alt_outlined,
                          color: Colors.amber,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.grey.shade300,
                        onTap: () {
                          if (roleId == 1 || roleId == 4) {
                            context.go('/hosotrungtuyenPage');
                          } else {
                            GlobalFunction.alertMessage(
                                'You do not have permission to view!',
                                'warning');
                          }
                        },
                        child: BoxInfo(
                          name: 'Hồ sơ trúng tuyển',
                          number: '${data.thongTinChung!.countTrungTuyen}',
                          icon: Icons.list_alt_outlined,
                          color: Colors.green,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.grey.shade300,
                        onTap: () {
                          if (roleId == 1 || roleId == 4) {
                            context.go('/hosonhaphocPage');
                          } else {
                            GlobalFunction.alertMessage(
                                'You do not have permission to view!',
                                'warning');
                          }
                        },
                        child: BoxInfo(
                          name: 'Hồ sơ nhập học',
                          number: '${data.thongTinChung!.countSinhVien}',
                          icon: Icons.list_alt_outlined,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // chart
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // name tabs bar
                        Container(
                          margin: const EdgeInsets.all(12),
                          height: 45,
                          child: TabBar(
                              overlayColor:
                                  WidgetStatePropertyAll(Colors.blue.shade100),
                              labelColor: Colors.blue,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Colors.blue,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: const [
                                Tab(
                                  text: 'BIỂU ĐỒ THỐNG KÊ \n    THEO NGHÀNH',
                                ),
                                Tab(
                                  text: 'BẢNG TỔNG HỢP \n  THEO NGHÀNH',
                                ),
                              ]),
                        ),
                        // tab bar view
                        SizedBox(
                          height: 370,
                          child: TabBarView(children: [
                            Chart(datachart: data),
                            SummaryTable(datachart: data),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                      });
                      context.read<KeyDataCubit>().setKeyData('0');
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
