import 'package:flutter/material.dart';
import '../../../constant/global/global_function.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/bangke_nhaphoctheonganh_model.dart';

class BangkeNhaphoctheonganhTable extends StatefulWidget {
  final List<BangKeNhapHocNganhModel> listBangKeNhapHocTheoNghanh;
  const BangkeNhaphoctheonganhTable(
      {super.key, required this.listBangKeNhapHocTheoNghanh});

  @override
  State<BangkeNhaphoctheonganhTable> createState() =>
      _BangkeNhaphoctheonganhTableState();
}

class _BangkeNhaphoctheonganhTableState
    extends State<BangkeNhaphoctheonganhTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 6,
      dataRowMaxHeight: 65,
      columnSpacing: 14,
      horizontalMargin: 10,
      columns: const [
        DataColumn(label: TitleColumnTable(title: 'STT')),
        DataColumn(label: TitleColumnTable(title: 'MÃ NGHÀNH\nTRÚNG TUYỂN')),
        DataColumn(label: TitleColumnTable(title: 'TÊN NGHÀNH\nTRÚNG TUYỂN')),
        DataColumn(label: TitleColumnTable(title: 'SỐ LƯỢNG')),
      ],
      source: _DataSource(
          data: widget.listBangKeNhapHocTheoNghanh,
          totalRow: widget.listBangKeNhapHocTheoNghanh.length,
          context: context),
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<BangKeNhapHocNganhModel> data;
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
      ]);
    }

    final item = data[index];

    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text('${index + 1}'))),
        DataCell(ConstrainedColumnTable(child: Text(item.maNganhTt ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.tenNganhTt ?? ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.tong != null
                ? '${GlobalFunction.convertToVND(item.tong!.toInt())}đ'
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
