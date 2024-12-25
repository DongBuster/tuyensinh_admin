import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../constant/global/global_variable.dart';
import '../../constant/global/global_widgets.dart';
import '../../data/models/dotdangki_model.dart';
import '../../data/models/nghanh_model.dart';
import 'logicUI/hosonhaphoc_logic_ui.dart';
import 'models/field_filter_data_model.dart';
import 'widgets/hosonhaphoc_table.dart';

class HoSoNhapHocPage extends StatefulWidget {
  const HoSoNhapHocPage({super.key});

  @override
  State<HoSoNhapHocPage> createState() => _HoSoNhapHocPageState();
}

class _HoSoNhapHocPageState extends State<HoSoNhapHocPage> {
  Timer? _timer;
  bool _isLoadingExceeded = false;
  Future<dynamic>? _future;
  FieldFilterDataModel fieldFilterData = FieldFilterDataModel.init();
  @override
  void initState() {
    _future = HosoNhapHocLogicUi.fetchListData();
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
      strokeWidth: 3,
      color: Colors.blue,
      onRefresh: () async {
        setState(() {
          _future = HosoNhapHocLogicUi.fetchListData();
          fieldFilterData = FieldFilterDataModel.init();
        });
      },
      child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          // print(snapshot.hasError);
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
            List<DotDangKiModel> listDotdangki = snapshot.data[0];
            List<String> listTenDotdangki =
                listDotdangki.map((e) => e.tenDot.toString()).toList();
            listTenDotdangki.insert(0, 'T/cả các đợt đăng kí');
            Map<String, dynamic> mapDotdangkiId = {'T/cả các đợt đăng kí': '0'};
            for (var e in listDotdangki) {
              mapDotdangkiId['${e.tenDot}'] = '${e.dotDangKyId}';
            }

            //----
            List<NganhModel> listNganh = snapshot.data[1];
            List<String> listTenNganh =
                listNganh.map((e) => '${e.maNganh} - ${e.tenNganh}').toList();
            Map<String, dynamic> mapNganhId = {};
            for (var e in listNganh) {
              mapNganhId['${e.maNganh} - ${e.tenNganh}'] = '${e.nganhId}';
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  //---- field filter ----
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: SelectTextInput(
                          listData: listTenDotdangki,
                          initValue: listTenDotdangki.first,
                          labelText: 'H/sơ theo đợt đăng kí',
                          onSelected: (value) {
                            fieldFilterData.dotdangkiId =
                                mapDotdangkiId['$value'];
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        flex: 2,
                        child: SelectDateInput(
                          onDateChanged: (value) {
                            var date = DateTime.parse(value);
                            fieldFilterData.createdTime =
                                DateFormat('yyyy/MM/dd').format(date);
                          },
                          initValue: '',
                          labelText: 'Từ ngày',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: SelectTextInput(
                          listData: listTenNganh,
                          initValue: '',
                          labelText: 'H/sơ theo ngành',
                          onSelected: (value) {
                            fieldFilterData.maNganh = mapNganhId['$value'];
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        flex: 2,
                        child: SelectDateInput(
                          onDateChanged: (value) {
                            fieldFilterData.endTime = value;
                          },
                          initValue: '',
                          labelText: 'Đến ngày',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: SelectTextInput(
                          listData: GlobalVariable.listStatusHosoNhapHocPage,
                          initValue:
                              GlobalVariable.listStatusHosoNhapHocPage.first,
                          labelText: 'Trạng thái',
                          onSelected: (value) {
                            fieldFilterData.status = GlobalVariable
                                .toJsonStatusHosoNhapHocPage[value];
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        flex: 2,
                        child: TextFieldInput(
                          onChanged: (value) {
                            fieldFilterData.maHoSo = value;
                          },
                          initValue: '',
                          labelText: 'Mã h/sơ hoặc số CMND',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: SelectTextInput(
                          listData: GlobalVariable.listTypeHosoNhapHocPage,
                          initValue:
                              GlobalVariable.listTypeHosoNhapHocPage.first,
                          labelText: 'Kiểu nhập học',
                          onSelected: (value) {
                            fieldFilterData.type =
                                GlobalVariable.toJsonTypeHosoNhapHocPage[value];
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        flex: 2,
                        child: TextFieldInput(
                          onChanged: (value) {
                            fieldFilterData.hoTen = value;
                          },
                          initValue: '',
                          labelText: 'Họ tên',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),
                  //---- list button ---
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: const ButtonAction(
                          width: 50,
                          height: 35,
                          title: 'LỌC',
                          titleColor: Colors.white,
                          backgroundColor: Colors.cyan,
                          fontSizeTitle: 13,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  //---- table thong tin hoso ----
                  HoSoNhapHocTable(fieldFilterData: fieldFilterData),
                ],
              ),
            );
          }
          if (snapshot.hasError || _isLoadingExceeded) {
            _timer?.cancel();
            _timer = null;
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
                        _future = HosoNhapHocLogicUi.fetchListData();
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
