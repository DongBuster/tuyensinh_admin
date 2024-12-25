import 'package:dio/dio.dart';
import 'package:dkxt_admin/constant/global/global_variable.dart';
import 'package:dkxt_admin/data/models/dotdangki_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../constant/global/global_function.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/hedaotao_model.dart';
import '../../../data/repositories/dotdangki_page_repo.dart';

class EditDotdangkiScreen extends StatefulWidget {
  final String title;
  final List<HeDaoTaoModel> listHedaotaos;
  final DotDangKiModel dotDangKiModel;
  const EditDotdangkiScreen(
      {super.key,
      required this.title,
      required this.listHedaotaos,
      required this.dotDangKiModel});

  @override
  State<EditDotdangkiScreen> createState() => _EditDotdangkiScreenState();
}

class _EditDotdangkiScreenState extends State<EditDotdangkiScreen> {
  Map<String, dynamic> hedaotaos = {};
  List<String> listNameHedaotao = [];
  DotdangkiPageRepo dotdangkiPageRepo = DotdangkiPageRepo();
  @override
  void initState() {
    for (var e in widget.listHedaotaos) {
      hedaotaos['${e.heDaoTaoId}'] = e.tenHeDaoTao;
      listNameHedaotao.add(e.tenHeDaoTao);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.dotDangKiModel.status);

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
                context.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'Sửa đợt ${widget.title}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: TextFieldInput(
                title: 'Mã đợt:',
                initValue: widget.dotDangKiModel.maDot!,
                onChanged: (String value) {
                  widget.dotDangKiModel.maDot = value;
                },
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 1,
              child: TextFieldInput(
                title: 'Tên đợt:',
                initValue: widget.dotDangKiModel.tenDot!,
                onChanged: (String value) {
                  widget.dotDangKiModel.tenDot = value;
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
                initValue: widget.dotDangKiModel.loaiDot ?? '',
                listData: GlobalVariable.listTenLoaiDot,
                onSelected: (value) {
                  widget.dotDangKiModel.loaiDot = value;
                },
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 2,
              child: SelectTextInput(
                title: 'Trạng thái:',
                initValue: widget.dotDangKiModel.status ?? '',
                listData: GlobalVariable.listStatusDotDangkiPage,
                onSelected: (value) {
                  widget.dotDangKiModel.status = value;
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
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                  child: QuantityInput(
                    initialValue: widget.dotDangKiModel.thuTu,
                    onChanged: (value) {
                      widget.dotDangKiModel.thuTu = value;
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
                initValue:
                    hedaotaos['${widget.dotDangKiModel.heDaoTaoId}'] ?? '',
                listData: listNameHedaotao,
                onSelected: (value) {
                  widget.dotDangKiModel.heDaoTaoId = hedaotaos['$value'];
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
                initValue: DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(widget.dotDangKiModel.ngayBatDau!)),
                title: 'Ngày bắt đầu:',
                onDateChanged: (value) {
                  widget.dotDangKiModel.ngayBatDau = value;
                },
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 1,
              child: SelectDateInput(
                initValue: DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(widget.dotDangKiModel.ngayKetThuc!)),
                title: 'Ngày kết thúc:',
                onDateChanged: (value) {
                  widget.dotDangKiModel.ngayKetThuc = value;
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
                initValue: DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(widget.dotDangKiModel.ngayCongBo!)),
                title: 'Ngày công bố:',
                onDateChanged: (value) {
                  widget.dotDangKiModel.ngayCongBo = value;
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                  child: QuantityInput(
                    initialValue: widget.dotDangKiModel.chiTieu,
                    onChanged: (value) {
                      widget.dotDangKiModel.chiTieu = value;
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                  child: QuantityInput(
                    initialValue: widget.dotDangKiModel.dieuKien != null
                        ? int.parse(widget.dotDangKiModel.dieuKien!)
                        : null,
                    onChanged: (value) {
                      widget.dotDangKiModel.dieuKien = '$value';
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
                initValue: DateFormat('dd/MM/yyyy').format(
                    DateTime.parse(widget.dotDangKiModel.admissionStartDate!)),
                title: 'Ngày nhập học:',
                onDateChanged: (value) {
                  widget.dotDangKiModel.admissionStartDate = value;
                },
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 1,
              child: SelectDateInput(
                initValue: DateFormat('dd/MM/yyyy').format(
                    DateTime.parse(widget.dotDangKiModel.admissionEndDate!)),
                title: 'Ngày kết thúc nhập học:',
                onDateChanged: (value) {
                  widget.dotDangKiModel.admissionEndDate = value;
                },
              ),
            ),
          ],
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
              // print(widget.dotDangKiModel.status);

              Response response = await dotdangkiPageRepo
                  .updateDotdangki(widget.dotDangKiModel);
              GlobalFunction.checkResponse(response);

              if (context.mounted) {
                Navigator.pop(context);
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
