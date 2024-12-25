import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/thongtinthisinh_model.dart';
import '../../../data/repositories/hosodangki_page_repo.dart';
import '../cubits/list_hoso_duyet.dart';
import '../models/field_filter_data_model.dart';
import 'list_task_hosott_table.dart';

class HoSoTableForAdmin extends StatefulWidget {
  final FieldFilterDataModel fieldFilterData;
  const HoSoTableForAdmin({super.key, required this.fieldFilterData});

  @override
  State<HoSoTableForAdmin> createState() => _HoSoTableForAdminState();
}

class _HoSoTableForAdminState extends State<HoSoTableForAdmin> {
  int _currentPage = 1;
  int _pageSize = 10;
  int _totalRow = 0;
  List<ThiSinh> _data = [];
  HosodangkiPageRepo hosodangkiPageRepo = HosodangkiPageRepo();
  late Future<dynamic> _future;

  Future<void> fetchData(
      int currentPage, int row, FieldFilterDataModel dataHeader) async {
    ThongtinthisinhModel model = ThongtinthisinhModel();

    //  dotdangkiId, nganhId, hoTen, ngayBd, ngayKt, maDangKy, numberPage, nguyenVongSo, status, nguoiTao, numberRow,
    model = await hosodangkiPageRepo.fetchListThongTinThiSinh(
      dataHeader.dotdangkiId,
      dataHeader.maNganh,
      dataHeader.hoTen,
      dataHeader.createdTime,
      dataHeader.endTime,
      dataHeader.maHoSo,
      '$currentPage',
      dataHeader.nguyenVong,
      dataHeader.status,
      dataHeader.nguoiTao,
      '$row',
    );

    _data.addAll(model.danhSachs!);
    // print(_data.length);
    _totalRow = model.tongSoThiSinh!;
  }

  @override
  void didUpdateWidget(covariant HoSoTableForAdmin oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _data = [];
      _future = fetchData(_currentPage, _pageSize, widget.fieldFilterData);
    });
  }

  @override
  void initState() {
    _future = fetchData(_currentPage, _pageSize, widget.fieldFilterData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.fieldFilterData.maNganh);

    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return PaginatedDataTable(
          rowsPerPage: _pageSize,
          availableRowsPerPage: const [10, 20],
          dataRowMaxHeight: 65,
          columnSpacing: 14,
          horizontalMargin: 10,
          onRowsPerPageChanged: (value) {
            setState(() {
              _pageSize = value!;
            });
          },
          onPageChanged: (value) {
            var numbePage = value ~/ _pageSize + 1;
            // if (numbePage < _currentPage) return;
            setState(() {
              _currentPage = numbePage;
              _future =
                  fetchData(_currentPage, _pageSize, widget.fieldFilterData);
            });
          },
          columns: const [
            DataColumn(label: TitleColumnTable(title: 'DUYỆT\n  H.S')),
            DataColumn(label: TitleColumnTable(title: 'TÁC VỤ')),
            DataColumn(label: TitleColumnTable(title: 'MÃ HỒ\n   SƠ')),
            DataColumn(label: TitleColumnTable(title: 'SỐ BÁO\nDANH')),
            DataColumn(label: TitleColumnTable(title: 'HỌ TÊN')),
            DataColumn(label: TitleColumnTable(title: 'NGÀY SINH')),
            DataColumn(label: TitleColumnTable(title: 'GIỚI TÍNH')),
            DataColumn(label: TitleColumnTable(title: 'SỐ CMND')),
            DataColumn(label: TitleColumnTable(title: 'SĐT')),
            DataColumn(label: TitleColumnTable(title: 'EMAIL')),
            DataColumn(label: TitleColumnTable(title: 'HỌ TÊN\n   BỐ')),
            DataColumn(label: TitleColumnTable(title: 'HỌ TÊN\n   MẸ')),
            DataColumn(label: TitleColumnTable(title: 'SĐT BỐ')),
            DataColumn(label: TitleColumnTable(title: 'SĐT MẸ')),
            DataColumn(label: TitleColumnTable(title: 'SỐ N/VỌNG')),
            DataColumn(label: TitleColumnTable(title: 'NGÀY\nĐĂNG KÍ')),
            DataColumn(label: TitleColumnTable(title: 'NGƯỜI\nĐĂNG KÍ')),
            DataColumn(label: TitleColumnTable(title: 'SỬA\nLẦN CUỐI')),
            DataColumn(label: TitleColumnTable(title: 'NGƯỜI\n SỬA')),
            DataColumn(label: TitleColumnTable(title: 'SỐ LẦN\n   SỬA')),
            DataColumn(label: TitleColumnTable(title: 'SỐ TIỀN\nĐÃ NỘP')),
          ],
          source:
              _DataSource(data: _data, totalRow: _totalRow, context: context),
        );
      },
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<ThiSinh> data;
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
        DataCell(Text('')),
      ]);
    }

    final item = data[index];
    return DataRow(
      cells: [
        DataCell(
          CheckBoxTable(
            initIsChecked: item.status == 'CHECKED' ? true : false,
            onCheckbox: (value) {
              value
                  ? context.read<ListHosoDuyetCubit>().addMaHoso(item.maHoSo!)
                  : context
                      .read<ListHosoDuyetCubit>()
                      .removeMaHoso(item.maHoSo!);
            },
          ),
        ),
        DataCell(ListTaskHosoTTTable(thiSinhModel: item)),
        DataCell(ConstrainedColumnTable(child: Text('${item.maHoSo ?? ''}'))),
        const DataCell(ConstrainedColumnTable(child: Text(''))),
        DataCell(ConstrainedColumnTable(child: Text(item.hoTen ?? ''))),
        DataCell(
          ConstrainedColumnTable(
              child: Text(item.ngaySinh != null
                  ? DateFormat('dd/MM/yyyy').format(item.ngaySinh!)
                  : '')),
        ),
        DataCell(ConstrainedColumnTable(child: Text(item.gioiTinh ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.soCmnd ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.soDienThoai ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.email!))),
        DataCell(ConstrainedColumnTable(child: Text(item.hoTenBo ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.hoTenMe ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.sdtBo ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.sdtMe ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text('${item.soNguyenVong ?? ''}'))),
        DataCell(
          ConstrainedColumnTable(
              child: Text(item.createdTime != null
                  ? DateFormat('dd/MM/yyyy').format(item.createdTime!)
                  : '')),
        ),
        DataCell(ConstrainedColumnTable(child: Text(item.createdBy ?? ''))),
        DataCell(
          ConstrainedColumnTable(
              child: Text(item.modifiedTime != null
                  ? DateFormat('dd/MM/yyyy').format(item.modifiedTime!)
                  : '')),
        ),
        DataCell(ConstrainedColumnTable(child: Text(item.modifiedBy ?? ''))),
        DataCell(
          ConstrainedColumnTable(child: Text('${item.changeCount ?? ''}')),
        ),
        DataCell(
          ConstrainedColumnTable(
              child: Text(item.soTienDaNop != null
                  ? '${GlobalFunction.convertToVND(item.soTienDaNop!)}đ'
                  : '0đ')),
        ),
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
