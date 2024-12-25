import 'package:dio/dio.dart';
import 'package:dkxt_admin/data/models/dotdangki_model.dart';
import 'package:dkxt_admin/data/models/hedaotao_model.dart';
import 'package:dkxt_admin/data/repositories/dotdangki_page_repo.dart';
import 'package:dkxt_admin/pages/dotdangkiPage/logicUI/dotdangki_logic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/info_dotdangki_model.dart';

class ListDotdangkiTableForUser extends StatefulWidget {
  List<DotDangKiModel> listDotDangki;
  List<HeDaoTaoModel> listHedaotao;

  ListDotdangkiTableForUser(
      {super.key, required this.listDotDangki, required this.listHedaotao});

  @override
  State<ListDotdangkiTableForUser> createState() =>
      _ListDotdangkiTableForUserState();
}

class _ListDotdangkiTableForUserState extends State<ListDotdangkiTableForUser> {
  late MyDataSource dataSource;
  int sortColumnIndex = 2;
  bool sortAscending = false;

  @override
  Widget build(BuildContext context) {
    dataSource = MyDataSource(
      listDotDangki: widget.listDotDangki,
      listHedaotao: widget.listHedaotao,
      lisInfoDotdangki:
          DotdangkiLogicUi.genarateDataTable(widget.listDotDangki),
      context: context,
    );
    return PaginatedDataTable(
      columns: const [
        DataColumn(label: Text('STT')),
        DataColumn(label: Text('Mã Đợt')),
        DataColumn(label: Text('Tên Đợt')),
        DataColumn(label: Text('Loại\nđợt')),
        DataColumn(label: Text('Trạng\nthái')),
      ],
      horizontalMargin: 12,
      columnSpacing: 12,
      source: dataSource,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      rowsPerPage: 7,
      dataRowMaxHeight: 65,
      onPageChanged: (value) {
        // print(value);
      },

      // dataRowMinHeight: 30,
    );
  }
}

class MyDataSource extends DataTableSource {
  final List<InfoDotdangkiModel> lisInfoDotdangki;
  final List<HeDaoTaoModel> listHedaotao;
  final List<DotDangKiModel> listDotDangki;
  final BuildContext context;
  MyDataSource({
    required this.lisInfoDotdangki,
    required this.context,
    required this.listHedaotao,
    required this.listDotDangki,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= lisInfoDotdangki.length) {
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
    final item = lisInfoDotdangki[index];
    DateTime now = DateTime.now();
    return DataRow(cells: [
      DataCell(Text('${index + 1}')),
      DataCell(SizedBox(width: 60, child: Text(item.maDot))),
      DataCell(SizedBox(width: 200, child: Text(item.tenDot))),
      DataCell(SizedBox(width: 60, child: Text(item.loaiDot))),
      DataCell(Text(DateTime.parse(item.ngayKetThuc).isBefore(now)
          ? 'Hết hạn'
          : 'Đăng kí')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => lisInfoDotdangki.length; // Trả về số lượng dòng
  @override
  int get selectedRowCount => 0;
}
