import 'dart:async';
import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:dkxt_admin/constant/global/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../data/models/bangke_nhaphoctheonganh_model.dart';
import '../../../data/repositories/bangke_nhaphoctheonganh_page_repo.dart';
import '../widgets/bangke_nhaphoctheonganh_table.dart';

class BangkeNhtheonganhPage extends StatefulWidget {
  const BangkeNhtheonganhPage({super.key});

  @override
  State<BangkeNhtheonganhPage> createState() => _BangkeNhtheonganhPageState();
}

class _BangkeNhtheonganhPageState extends State<BangkeNhtheonganhPage> {
  Timer? _timer;
  bool _isLoadingExceeded = false;
  late Future _future;

  BangkeNhaphocTheoNganhPageRepo bangkeNhaphocTheoNganhPageRepo =
      BangkeNhaphocTheoNganhPageRepo();

  @override
  void initState() {
    _future = bangkeNhaphocTheoNganhPageRepo.getListBangkeNhaphocTheoNganh();
    super.initState();
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
          _future =
              bangkeNhaphocTheoNganhPageRepo.getListBangkeNhaphocTheoNganh();
        });
      },
      child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
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
              List<BangKeNhapHocNganhModel> list = snapshot.data;
              // print(snapshot.data);
              double tongTien = 0;
              for (var e in list) {
                tongTien += e.tong!;
              }

              return ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _future = bangkeNhaphocTheoNganhPageRepo
                                .getListBangkeNhaphocTheoNganh();
                          });
                        },
                        child: const ButtonAction(
                          width: 90,
                          height: 35,
                          title: 'LÀM MỚI',
                          titleColor: Colors.white,
                          backgroundColor: Colors.cyan,
                          fontSizeTitle: 13,
                        ),
                      ),
                      Text(
                          'Tổng tiền: ${GlobalFunction.convertToVND(tongTien.toInt())}đ'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  BangkeNhaphoctheonganhTable(
                      listBangKeNhapHocTheoNghanh: list),
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
                          _future = bangkeNhaphocTheoNganhPageRepo
                              .getListBangkeNhaphocTheoNganh();
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
