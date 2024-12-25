import 'dart:async';
import 'package:dkxt_admin/data/models/hedaotao_model.dart';
import 'package:dkxt_admin/data/models/kinhphi_nhaphoc_model.dart';
import 'package:dkxt_admin/pages/danhmucPage/widgets/kinhphi_nhaphoc_table.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../data/repositories/kinhphi_nhaphoc_page_repo.dart';

class KinhphiNhaphocPage extends StatefulWidget {
  const KinhphiNhaphocPage({super.key});

  @override
  State<KinhphiNhaphocPage> createState() => _KinhphiNhaphocPageState();
}

class _KinhphiNhaphocPageState extends State<KinhphiNhaphocPage> {
  Timer? _timer;
  bool _isLoadingExceeded = false;
  late Future _future;
  @override
  void initState() {
    _future = fetchListData();
    super.initState();
  }

  Future<List<dynamic>> fetchListData() async {
    KinhphiNhaphocPageRepo kinhphiNhaphocPageRepo = KinhphiNhaphocPageRepo();

    var listKinhPhiNhapHoc =
        await kinhphiNhaphocPageRepo.getListKinhPhiNhapHoc();
    var listHeDaoTao = await kinhphiNhaphocPageRepo.getListHeDaoTao();
    return [listKinhPhiNhapHoc, listHeDaoTao];
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
          _future = fetchListData();
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

              // print(snapshot.data);
              List<KinhPhiNhapHocModel> listKinhPhiNhapHoc = snapshot.data[0];
              List<HeDaoTaoModel> listHeDaoTao = snapshot.data[1];

              return ListView(
                shrinkWrap: true,
                children: [
                  KinhphiNhaphocTable(
                    listKinhphiNhapHocModel: listKinhPhiNhapHoc,
                    listHeDaoTao: listHeDaoTao,
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
                        });
                      },
                      child: const Text("Refresh"),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
