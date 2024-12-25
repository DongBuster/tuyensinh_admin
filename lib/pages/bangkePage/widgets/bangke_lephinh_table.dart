import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constant/global/global_function.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/bangke_lephinh_model.dart';

class BangkeLephinhTable extends StatefulWidget {
  final List<BangKeLePhiNhModel> listBangKeLePhiNh;
  const BangkeLephinhTable({super.key, required this.listBangKeLePhiNh});

  @override
  State<BangkeLephinhTable> createState() => _BangkeLephinhTableState();
}

class _BangkeLephinhTableState extends State<BangkeLephinhTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 6,
      dataRowMaxHeight: 65,
      columnSpacing: 14,
      horizontalMargin: 10,
      columns: const [
        DataColumn(label: TitleColumnTable(title: 'STT')),
        DataColumn(label: TitleColumnTable(title: 'MÃ SINH VIÊN')),
        DataColumn(label: TitleColumnTable(title: 'HỌ TÊN')),
        DataColumn(label: TitleColumnTable(title: 'NGÀNH')),
        DataColumn(label: TitleColumnTable(title: 'NGÀY\nNỘP')),
        DataColumn(label: TitleColumnTable(title: 'SỐ CHỨNG\n     TỪ')),
        DataColumn(label: TitleColumnTable(title: 'TỔNG')),
      ],
      source: _DataSource(
          data: widget.listBangKeLePhiNh,
          totalRow: widget.listBangKeLePhiNh.length,
          context: context),
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<BangKeLePhiNhModel> data;
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
      ]);
    }

    final item = data[index];

    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text('${index + 1}'))),
        DataCell(ConstrainedColumnTable(child: Text(item.maSinhVien ?? ''))),
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
