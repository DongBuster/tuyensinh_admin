import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:dkxt_admin/data/models/khoa_model.dart';
import 'package:dkxt_admin/data/models/nghanh_model.dart';
import 'package:dkxt_admin/data/models/tohop_model.dart';
import '../../../data/repositories/nganh_repo.dart';
import '../widgets/nganh_table.dart';
import '../model/view_nghanhpage_model.dart';

class NganhPage extends StatefulWidget {
  const NganhPage({super.key});

  @override
  State<NganhPage> createState() => _NganhPageState();
}

class _NganhPageState extends State<NganhPage> {
  Timer? _timer;
  bool _isLoadingExceeded = false;
  late Future _future;
  NganhPageRepo nganhPageRepo = NganhPageRepo();

  Future<List<dynamic>> fetchListData() async {
    NganhPageRepo nganhPageRepo = NganhPageRepo();

    var listKhoa = await nganhPageRepo.getListKhoa();
    var listNganh = await nganhPageRepo.getListNganh();
    var listToHop = await nganhPageRepo.getListToHop();
    return [listKhoa, listNganh, listToHop];
  }

  @override
  void initState() {
    _future = fetchListData();
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
              List<KhoaModel> listKhoa = snapshot.data[0];
              List<NganhModel> listNganh = snapshot.data[1];
              List<ToHopModel> listToHop = snapshot.data[2];
              List<ViewNghanhpageModel> listViewNghanhpageModel = [];
              for (var nganh in listNganh) {
                ViewNghanhpageModel model = ViewNghanhpageModel(
                  nganhId: nganh.nganhId!,
                  maNganh: nganh.maNganh!,
                  tenNganh: nganh.tenNganh!,
                  chiTieuHb: nganh.chiTieuHb!,
                  chiTieuThpt: nganh.chiTieuThpt!,
                  choPhepDk: nganh.choPhepDk!,
                  soTohop: nganh.nganhToHop!.length,
                  tenKhoa: getTenKhoaById(nganh.nganhId!, listKhoa),
                  tohop: getToHop(nganh, nganh.nganhToHop!, listToHop),
                );
                listViewNghanhpageModel.add(model);
              }
              // print(listViewModel[0].tohop);
              return ListView(
                shrinkWrap: true,
                children: [
                  NganhTable(listViewNghanhpageModel: listViewNghanhpageModel)
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

String getTenKhoaById(int khoaId, List<KhoaModel> listKhoa) {
  for (var khoa in listKhoa) {
    if (khoa.khoaId == khoaId) {
      return khoa.tenKhoa ?? "";
    }
  }
  return "";
}

List<String> getToHop(NganhModel nganh, List<NganhToHop> listNganhToHop,
    List<ToHopModel> listToHop) {
  List<String> listNameToHop = [];
  try {
    for (var nganhToHop in nganh.nganhToHop!) {
      for (var tohop in listToHop) {
        if (nganhToHop.toHopId == tohop.toHopId) {
          listNameToHop.add('${tohop.maToHop} (${tohop.tenToHop!})');
        }
      }
    }
  } catch (e) {
    listNameToHop = [];
  }
  return listNameToHop;
}
