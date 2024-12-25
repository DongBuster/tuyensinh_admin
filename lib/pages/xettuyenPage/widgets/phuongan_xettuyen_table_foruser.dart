import 'package:dkxt_admin/constant/global/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/xettuyen_page_model.dart';
import '../logicUI/xettuyen_logic_ui.dart';

class PhuonganXettuyenTableForUser extends StatefulWidget {
  final String dotdangkiId;
  const PhuonganXettuyenTableForUser({super.key, required this.dotdangkiId});

  @override
  State<PhuonganXettuyenTableForUser> createState() =>
      _PhuonganXettuyenTableForUserState();
}

class _PhuonganXettuyenTableForUserState
    extends State<PhuonganXettuyenTableForUser> {
  int _totalRow = 0;
  List<PhuongAnXetTuyens> _data = [];
  late Future<dynamic> _future;

  Future<List<dynamic>> fetchData(String dotdangkiId) async {
    XetTuyenPageModel model = XetTuyenPageModel();

    model = await XettuyenLogicUi.fetchDataTable(dotdangkiId);
    _data = model.phuongAnXetTuyens!;
    _totalRow = model.phuongAnXetTuyens!.length;
    return [_data, _totalRow];
  }

  @override
  Widget build(BuildContext context) {
    _future = fetchData(widget.dotdangkiId);

    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PaginatedDataTable(
            rowsPerPage: 7,
            showEmptyRows: false,
            columnSpacing: 16,
            horizontalMargin: 10,
            columns: const [
              DataColumn(
                  label: TitleColumnTable(title: '       MÃ\nPHƯƠNG ÁN')),
              DataColumn(
                  label: TitleColumnTable(title: '      TÊN\nPHƯƠNG ÁN')),
              DataColumn(label: TitleColumnTable(title: '   NGÀY\nX/TUYỂN')),
              DataColumn(
                  label: TitleColumnTable(title: 'TỔNG S/LƯỢNG\nTRÚNG TUYỂN')),
              DataColumn(label: TitleColumnTable(title: 'STATUS')),
            ],
            source: _DataSource(data: _data, totalRow: _totalRow),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<PhuongAnXetTuyens> data;

  _DataSource({required this.data, required this.totalRow});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return const DataRow(
        cells: [
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Text('')),
        ],
      );
    }

    final item = data[index];
    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text(item.maPhuongAn ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.tenPhuongAn ?? ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.createdTime != null
                ? DateFormat('dd/MM/yyyy').format(item.createdTime!)
                : ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.soLuongTrungTuyen != null
                ? '${item.soLuongTrungTuyen}'
                : ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(
                GlobalVariable.fromJsonStatusTrungtuyenPage[item.status] ??
                    ''))),
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
