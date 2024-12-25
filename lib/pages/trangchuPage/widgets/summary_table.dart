import 'package:dkxt_admin/pages/trangchuPage/models/summary_table_model.dart';
import 'package:flutter/material.dart';

import '../../../data/models/dashboard_model.dart';
import '../logicUI/trangchu_logic_ui.dart';

class SummaryTable extends StatefulWidget {
  final DashboardModel datachart;

  const SummaryTable({super.key, required this.datachart});

  @override
  State<SummaryTable> createState() => _SummaryTableState();
}

class _SummaryTableState extends State<SummaryTable> {
  late MyDataSource dataSource;
  int sortColumnIndex = 2;
  bool sortAscending = false;
  @override
  void initState() {
    dataSource = MyDataSource(
        data: TrangchuLogicUi.genarateDataSummary(widget.datachart));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columns: [
        const DataColumn(label: Text('Mã ngành')),
        const DataColumn(label: Text('Tên ngành')),
        DataColumn(
          label: const Text('Nguyện vọng'),
          onSort: (columnIndex, ascending) {
            setState(() {
              sortColumnIndex = columnIndex;
              sortAscending = ascending;
              dataSource.sort((d) => d.soNguyenVong, ascending);
            });
          },
        ),
        DataColumn(
          label: const Text('Đăng kí (NV1)'),
          onSort: (columnIndex, ascending) {
            setState(() {
              sortColumnIndex = columnIndex;
              sortAscending = ascending;
              dataSource.sort((d) => d.soHoso, ascending);
            });
          },
        ),
        DataColumn(
          label: const Text('Trúng tuyển '),
          onSort: (columnIndex, ascending) {
            setState(() {
              sortColumnIndex = columnIndex;
              sortAscending = ascending;
              dataSource.sort((d) => d.soTrungTruyen, ascending);
            });
          },
        ),
        DataColumn(
          label: const Text('Nhập học'),
          onSort: (columnIndex, ascending) {
            setState(() {
              sortColumnIndex = columnIndex;
              sortAscending = ascending;
              dataSource.sort((d) => d.soSinhVien, ascending);
            });
          },
        ),
      ],
      horizontalMargin: 12,
      columnSpacing: 12,
      source: dataSource, // Cung cấp dữ liệu cho bảng
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      rowsPerPage: 5, // Số hàng trên mỗi trang
      showFirstLastButtons: true, // Hiển thị nút "Trang đầu" và "Trang cuối"
    );
  }
}

class MyDataSource extends DataTableSource {
  final List<SummaryTableModel> data;

  MyDataSource({required this.data});

  // Hàm sắp xếp
  void sort<T>(
      Comparable<T> Function(SummaryTableModel d) getField, bool ascending) {
    data.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners(); // Cập nhật lại giao diện khi sắp xếp xong
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    final item = data[index];
    return DataRow(cells: [
      DataCell(Text(item.maNganh)),
      DataCell(Text(item.tenNganh)),
      DataCell(Text(item.soNguyenVong.toString())),
      DataCell(Text(item.soHoso.toString())),
      DataCell(Text(item.soTrungTruyen.toString())),
      DataCell(Text(item.soSinhVien.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length; // Trả về số lượng dòng
  @override
  int get selectedRowCount => 0;
}
