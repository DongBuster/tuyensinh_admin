import 'package:dio/dio.dart';
import 'package:dkxt_admin/constant/global/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constant/global/global_function.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/hedaotao_model.dart';
import '../../../data/repositories/dotdangki_page_repo.dart';

class AddDotdangkiScreen extends StatefulWidget {
  final List<HeDaoTaoModel> listHedaotaos;

  const AddDotdangkiScreen({
    super.key,
    required this.listHedaotaos,
  });

  @override
  State<AddDotdangkiScreen> createState() => _AddDotdangkiScreenState();
}

class _AddDotdangkiScreenState extends State<AddDotdangkiScreen> {
  DotdangkiPageRepo dotdangkiPageRepo = DotdangkiPageRepo();
  late Map<String, dynamic> data;
  Map<String, dynamic> hedaotaos = {};
  List<String> listNameHedaotao = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    for (var e in widget.listHedaotaos) {
      hedaotaos['${e.heDaoTaoId}'] = e.tenHeDaoTao;
      listNameHedaotao.add(e.tenHeDaoTao);
    }
    data = {
      "createdTime": null,
      "createdBy": null,
      "modifiedTime": null,
      "modifiedBy": null,
      "maDot": '',
      "tenDot": '',
      "loaiDot": '',
      "heDaoTaoId": 1,
      "ngayBatDau": '',
      "ngayKetThuc": '',
      "ngayCongBo": '',
      "chiTieu": null,
      "dieuKien": null,
      "lePhiXetTuyen": 0,
      "admissionStartDate": '',
      "admissionEndDate": '',
      "status": '',
      "thuTu": 0,
    };
    super.initState();
  }

  bool isHasValuesNull(Map<String, dynamic> map) {
    return map.values.any((value) => value == '');
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.listHedaotaos);
    return ListView(
      padding: const EdgeInsets.all(10.0),
      shrinkWrap: true,
      children: [
        // tilte
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context, false);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.blue,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'Thêm đợt đăng kí',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFieldInput(
                      title: 'Mã đợt:',
                      initValue: '',
                      onChanged: (String value) {
                        data['maDot'] = value;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: TextFieldInput(
                      title: 'Tên đợt:',
                      initValue: '',
                      onChanged: (String value) {
                        data['tenDot'] = value;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: SelectTextInput(
                      title: 'Loại đợt:',
                      initValue: '',
                      listData: GlobalVariable.listTenLoaiDot,
                      onSelected: (value) {
                        data['loaiDot'] = value;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 2,
                    child: SelectTextInput(
                      title: 'Trạng thái:',
                      initValue: '',
                      listData: GlobalVariable.listStatusDotDangkiPage,
                      onSelected: (value) {
                        data['status'] = value;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      const Text(
                        'Thứ tự:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
                        ),
                        child: QuantityInput(
                          initialValue: 0,
                          onChanged: (value) {
                            data['thuTu'] = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: SelectTextInput(
                      title: 'Hệ đào tạo:',
                      initValue: '',
                      listData: listNameHedaotao,
                      onSelected: (value) {
                        data['heDaoTaoId'] = hedaotaos['$value'];
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: SelectDateInput(
                      initValue: '',
                      title: 'Ngày bắt đầu:',
                      onDateChanged: (value) {
                        data['ngayBatDau'] = value;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: SelectDateInput(
                      initValue: '',
                      title: 'Ngày kết thúc:',
                      onDateChanged: (value) {
                        data['ngayKetThuc'] = value;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SelectDateInput(
                      initValue: '',
                      title: 'Ngày công bố:',
                      onDateChanged: (value) {
                        data['ngayCongBo'] = value;
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      const Text(
                        'Chỉ tiêu:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
                        ),
                        child: QuantityInput(
                          initialValue: 0,
                          onChanged: (value) {
                            data['chiTieu'] = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      const Text(
                        'Điều kiện:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
                        ),
                        child: QuantityInput(
                          initialValue: 0,
                          onChanged: (value) {
                            data['dieuKien'] = '$value';
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: SelectDateInput(
                      initValue: '',
                      title: 'Ngày nhập học:',
                      onDateChanged: (value) {
                        data['admissionStartDate'] = value;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: SelectDateInput(
                      initValue: '',
                      title: 'Ngày kết thúc nhập học:',
                      onDateChanged: (value) {
                        data['admissionEndDate'] = value;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
              padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(3, 0, 3, 0)),
            ),
            onPressed: () async {
              if (isHasValuesNull(data)) {
                Fluttertoast.showToast(
                  msg: 'Please fill in all information',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.amber,
                  textColor: Colors.black,
                  fontSize: 16.0,
                );
              } else {
                Response response = await dotdangkiPageRepo.postDotdangki(data);
                GlobalFunction.checkResponse(response);

                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
