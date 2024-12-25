import 'dart:async';
import 'package:dkxt_admin/pages/xettuyenPage/widgets/phuongan_xettuyen_table_foruser.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/global/global_widgets.dart';
import '../../data/models/dotdangki_model.dart';
import 'logicUI/xettuyen_logic_ui.dart';
import 'widgets/bangthongke_xettuyen_table_.dart';
import 'widgets/phuongan_xettuyen_table_foradmin.dart';
import 'widgets/bieudo_xettuyen_table.dart';

class XettuyenPage extends StatefulWidget {
  const XettuyenPage({super.key});

  @override
  State<XettuyenPage> createState() => _XettuyenPageState();
}

class _XettuyenPageState extends State<XettuyenPage> {
  Timer? _timer;
  bool _isLoadingExceeded = false;
  Future<dynamic>? _future;
  String dotdangkiId = '';
  int roleId = -1;

  @override
  void initState() {
    fetchRoleId();
    _future = XettuyenLogicUi.fetchDotDangkis();

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
    return RefreshIndicator(
      displacement: 5,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      strokeWidth: 3,
      color: Colors.blue,
      onRefresh: () async {
        setState(() {
          dotdangkiId = '';
          _future = XettuyenLogicUi.fetchDotDangkis();
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
                _timer?.cancel();
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
            List<DotDangKiModel> listDotdangki = snapshot.data;
            List<String> listTenDotdangki =
                listDotdangki.map((e) => e.tenDot.toString()).toList();
            Map<String, dynamic> mapDotdangkiId = {};
            for (var e in listDotdangki) {
              mapDotdangkiId['${e.tenDot}'] = '${e.dotDangKyId}';
            }
            dotdangkiId == ''
                ? dotdangkiId = '${listDotdangki.first.dotDangKyId}'
                : null;

            //--------
            return Scrollbar(
              thickness: 10,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(12, 5, 12, 12),
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: SelectTextInput(
                          listData: listTenDotdangki,
                          initValue: listTenDotdangki.first,
                          onSelected: (value) {
                            setState(() {
                              dotdangkiId = mapDotdangkiId[value];
                            });
                          },
                        ),
                      ),
                      const Flexible(flex: 1, child: SizedBox()),
                    ],
                  ),
                  const SizedBox(height: 8),
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          height: 60,
                          child: const TabBar(
                            labelPadding: EdgeInsets.zero,
                            dividerColor: Colors.transparent,
                            dividerHeight: 3,
                            unselectedLabelColor: Colors.white54,
                            labelColor: Colors.white,
                            indicator: UnderlineTabIndicator(
                              borderSide:
                                  BorderSide(width: 3.0, color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              insets: EdgeInsets.symmetric(horizontal: 100),
                            ),
                            indicatorWeight: 2,
                            tabs: [
                              Tab(text: 'Phương án\n xét tuyển'),
                              Tab(text: 'Biểu đồ thống\n  kê xét tuyển'),
                              Tab(text: 'Bảng thống kê\n    xét tuyển'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 300,
                            maxHeight: 550,
                          ),
                          child: TabBarView(
                            children: [
                              roleId == 1
                                  ? PhuonganXettuyenTableForAdmin(
                                      dotdangkiId: dotdangkiId)
                                  : PhuonganXettuyenTableForUser(
                                      dotdangkiId: dotdangkiId),
                              BieudoThongkeXetTuyen(dotdangkiId: dotdangkiId),
                              BangThongKeXetTuyenTable(dotdangkiId: dotdangkiId)
                            ],
                          ),
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
                        _future = XettuyenLogicUi.fetchDotDangkis();
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
