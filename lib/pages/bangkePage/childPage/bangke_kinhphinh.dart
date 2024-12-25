import 'dart:async';
import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:dkxt_admin/constant/global/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../data/models/bangke_kinhphinh_model.dart';
import '../../../data/repositories/bangke_kinhphinh_page_repo.dart';
import '../widgets/bangke_kinhphinh_table.dart';

class BangkeKinhphinhPage extends StatefulWidget {
  const BangkeKinhphinhPage({super.key});

  @override
  State<BangkeKinhphinhPage> createState() => _BangkeKinhphinhPageState();
}

class _BangkeKinhphinhPageState extends State<BangkeKinhphinhPage> {
  Timer? _timer;
  bool _isLoadingExceeded = false;
  late Future _future;
  String initTime = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String initStartDay = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String initEndDay = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String startDay = '';
  String endDay = '';
  BangkeKinhphinhPageRepo bangkeKinhphinhPageRepo = BangkeKinhphinhPageRepo();

  @override
  void initState() {
    _future =
        bangkeKinhphinhPageRepo.getListBangKeKinhPhiNh(initTime, initTime);
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
          initStartDay = DateFormat('dd/MM/yyyy').format(DateTime.now());
          initEndDay = DateFormat('dd/MM/yyyy').format(DateTime.now());
          _future = bangkeKinhphinhPageRepo.getListBangKeKinhPhiNh(
              initTime, initTime);
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
              List<BangKeKinhPhiNhModel> list = snapshot.data;
              // print(snapshot.data);
              double tongTien = 0;
              for (var e in list) {
                tongTien += e.soTien!;
              }

              return ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SelectDateInput(
                          labelText: 'Từ ngày',
                          onDateChanged: (value) {
                            var time = DateTime.parse(value);
                            startDay = DateFormat('yyyy/MM/dd').format(time);
                            initStartDay =
                                DateFormat('dd/MM/yyyy').format(time);
                          },
                          initValue: initStartDay,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        flex: 1,
                        child: SelectDateInput(
                          labelText: 'Đến ngày',
                          onDateChanged: (value) {
                            var time = DateTime.parse(value);
                            endDay = DateFormat('yyyy/MM/dd').format(time);
                            initEndDay = DateFormat('dd/MM/yyyy').format(time);
                          },
                          initValue: initEndDay,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            initStartDay;
                            initEndDay;
                            _future = bangkeKinhphinhPageRepo
                                .getListBangKeKinhPhiNh(startDay, endDay);
                          });
                        },
                        child: const ButtonAction(
                          width: 55,
                          height: 35,
                          title: 'LỌC',
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
                  BangkeKinhphinhTable(listBangKeKinhPhiNh: list),
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
                          _future = bangkeKinhphinhPageRepo
                              .getListBangKeKinhPhiNh(initTime, initTime);
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
