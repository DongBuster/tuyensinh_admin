import 'dart:async';
import 'package:dkxt_admin/pages/danhmucPage/widgets/khoa_table.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../data/repositories/khoa_page_repo.dart';

class KhoaPage extends StatefulWidget {
  const KhoaPage({super.key});

  @override
  State<KhoaPage> createState() => _KhoaPageState();
}

class _KhoaPageState extends State<KhoaPage> {
  Timer? _timer;
  bool _isLoadingExceeded = false;
  late Future _future;
  KhoaPageRepo khoaPageRepo = KhoaPageRepo();
  @override
  void initState() {
    _future = khoaPageRepo.getListKhoa();
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
          _future = khoaPageRepo.getListKhoa();
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

              return ListView(
                shrinkWrap: true,
                children: [KhoaTable(listKhoa: snapshot.data)],
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
