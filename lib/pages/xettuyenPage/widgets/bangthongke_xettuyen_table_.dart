import 'package:flutter/material.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/xettuyen_page_model.dart';
import '../logicUI/xettuyen_logic_ui.dart';

class BangThongKeXetTuyenTable extends StatefulWidget {
  final String dotdangkiId;
  const BangThongKeXetTuyenTable({super.key, required this.dotdangkiId});

  @override
  State<BangThongKeXetTuyenTable> createState() =>
      _BangThongKeXetTuyenTableState();
}

class _BangThongKeXetTuyenTableState extends State<BangThongKeXetTuyenTable> {
  int _totalRow = 0;
  // final List<ThongTinNganhXetTuyens> _data = [];
  Map<String, dynamic> mapNamePhuongAn = {};
  String maPhuongAnSelected = '';
  late Future<dynamic> _future;

  Future<List<dynamic>> fetchData(String dotdangkiId) async {
    XetTuyenPageModel model = XetTuyenPageModel();
    model = await XettuyenLogicUi.fetchDataTable(dotdangkiId);

    if (mapNamePhuongAn.isEmpty) {
      for (var e in model.phuongAnXetTuyens!) {
        mapNamePhuongAn[e.tenPhuongAn!] = e.maPhuongAn;
      }
    }

    var listData = await XettuyenLogicUi.fetchDataTableStatistical(dotdangkiId);
    List<Report> item1 = listData[0];
    List<ThongTin> dataTable = [];
    if (model.phuongAnXetTuyens!.isNotEmpty) {
      maPhuongAnSelected.isEmpty
          ? maPhuongAnSelected = mapNamePhuongAn.values.first
          : null;
      dataTable = item1
          .firstWhere((element) => element.maPhuongAn == maPhuongAnSelected)
          .thongTin;
    }
    List<ThongTinNganhXetTuyens> item2 = listData[1];
    _totalRow = item2.length;
    return [dataTable, item2];
  }

  @override
  void dispose() {
    mapNamePhuongAn = {};
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _future = fetchData(widget.dotdangkiId);

    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        // print(snapshot.data);

        if (snapshot.hasData) {
          List<String> listNamePhuongAn = mapNamePhuongAn.keys.toList();
          // print(snapshot.data[1]);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listNamePhuongAn.isNotEmpty
                  ? SelectTextInput(
                      listData: listNamePhuongAn,
                      initValue: listNamePhuongAn.first,
                      onSelected: (value) {
                        setState(() {
                          maPhuongAnSelected = mapNamePhuongAn[value];
                        });
                      },
                    )
                  : const SizedBox(),
              PaginatedDataTable(
                rowsPerPage: 8,
                showEmptyRows: false,
                columnSpacing: 16,
                horizontalMargin: 10,
                columns: const [
                  DataColumn(label: TitleColumnTable(title: '  MÃ\nNGÀNH')),
                  DataColumn(label: TitleColumnTable(title: '  TÊN\nNGÀNH')),
                  DataColumn(label: TitleColumnTable(title: 'MÃ TỔ\n  HỢP')),
                  DataColumn(
                      label: TitleColumnTable(title: 'CHỈ TIÊU\n    XÉT')),
                  DataColumn(
                      label: TitleColumnTable(title: 'ĐIỂM XÉT\n    MIN')),
                  DataColumn(
                      label: TitleColumnTable(title: 'ĐIỂM TRÚNG\n    TUYỂN')),
                  DataColumn(
                      label: TitleColumnTable(title: 'TIÊU CHÍ\n    PHỤ')),
                  DataColumn(
                      label:
                          TitleColumnTable(title: '   ĐIỂM MIN\nTIÊU CHÍ PHỤ')),
                  DataColumn(
                      label:
                          TitleColumnTable(title: '   SỐ LƯỢNG\nTRÚNG TUYỂN')),
                ],
                source: _DataSource(data: snapshot.data, totalRow: _totalRow),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<dynamic> data;

  _DataSource({required this.data, required this.totalRow});

  @override
  DataRow? getRow(int index) {
    if (index >= data[1].length) {
      return const DataRow(
        cells: [
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Text('')),
        ],
      );
    }
    List<ThongTin> dataThongtin = data[0];
    List<ThongTinNganhXetTuyens> dataThongtinXetTuyen = data[1];
    if (dataThongtin.isEmpty) {
      dataThongtin = List.generate(
          dataThongtinXetTuyen.length, (index) => ThongTin.init());
    }
    final item1 = dataThongtin[index];
    final item2 = dataThongtinXetTuyen[index];
    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text(item2.maNganh ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item2.tenNganh ?? ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item2.toHops!.map((e) => e.maToHop).join(', ')))),
        DataCell(
            ConstrainedColumnTable(child: Text('${item1.chiTieuXet ?? ''}'))),
        DataCell(
            ConstrainedColumnTable(child: Text('${item1.diemXetMin ?? ''}'))),
        DataCell(ConstrainedColumnTable(
            child: Text('${item1.diemTrungTuyen ?? ''}'))),
        DataCell(ConstrainedColumnTable(child: Text('${item1.tenTieuChiPhu}'))),
        DataCell(
            ConstrainedColumnTable(child: Text('${item1.tieuChiPhu ?? ''}'))),
        DataCell(ConstrainedColumnTable(
            child: Text('${item1.soLuongTrungTuyen ?? ''}'))),
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
