import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/bangke_kinhphinh_model.dart';

class BangkeKinhphinhTable extends StatefulWidget {
  final List<BangKeKinhPhiNhModel> listBangKeKinhPhiNh;
  const BangkeKinhphinhTable({super.key, required this.listBangKeKinhPhiNh});

  @override
  State<BangkeKinhphinhTable> createState() => _BangkeKinhphinhTableState();
}

class _BangkeKinhphinhTableState extends State<BangkeKinhphinhTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 6,
      dataRowMaxHeight: 65,
      columnSpacing: 14,
      horizontalMargin: 10,
      columns: const [
        DataColumn(label: TitleColumnTable(title: 'STT')),
        DataColumn(label: TitleColumnTable(title: 'HỌ TÊN')),
        DataColumn(label: TitleColumnTable(title: 'NGHÀNH')),
        DataColumn(label: TitleColumnTable(title: 'NGÀY\nNỘP')),
        DataColumn(label: TitleColumnTable(title: 'SỐ CHỨNG\n     TỪ')),
        DataColumn(label: TitleColumnTable(title: 'HỌC PHÍ\n(TẠM THU)')),
        DataColumn(label: TitleColumnTable(title: 'KHÁM SỨC\n     KHỎE')),
        DataColumn(label: TitleColumnTable(title: 'BẢO HIỂM Y TẾ\n(15 THÁNG)')),
        DataColumn(label: TitleColumnTable(title: 'THẺ SINH\n     VIÊN')),
        DataColumn(label: TitleColumnTable(title: 'TỔNG')),
      ],
      source: _DataSource(
          data: widget.listBangKeKinhPhiNh,
          totalRow: widget.listBangKeKinhPhiNh.length,
          context: context),
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<BangKeKinhPhiNhModel> data;
  BuildContext context;

  _DataSource(
      {required this.data, required this.totalRow, required this.context});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return const DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
      ]);
    }

    final item = data[index];

    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text('${index + 1}'))),
        DataCell(ConstrainedColumnTable(child: Text(item.hoTen ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.tenNganh ?? ''))),
        DataCell(
          ConstrainedColumnTable(
            child: Text(item.createdTime != null
                ? DateFormat('dd/MM/yyyy').format(item.createdTime!)
                : ''),
          ),
        ),
        DataCell(ConstrainedColumnTable(child: Text(item.soChungTu ?? ''))),
        DataCell(
          ConstrainedColumnTable(
              child: Text(item.tienHocPhi != null
                  ? '${GlobalFunction.convertToVND(item.tienHocPhi!.toInt())}đ'
                  : '')),
        ),
        DataCell(ConstrainedColumnTable(
            child: Text(item.tienKhamSk != null
                ? '${GlobalFunction.convertToVND(item.tienKhamSk!.toInt())}đ'
                : ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.tienBhyt != null
                ? '${GlobalFunction.convertToVND(item.tienHocPhi!.toInt())}đ'
                : ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.tienTheSv != null
                ? '${GlobalFunction.convertToVND(item.tienTheSv!.toInt())}đ'
                : ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.soTien != null
                ? '${GlobalFunction.convertToVND(item.soTien!.toInt())}đ'
                : ''))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalRow;

  @override
  int get selectedRowCount => 0;
}
