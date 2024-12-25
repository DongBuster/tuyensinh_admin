import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constant/global/global_function.dart';
import '../../../constant/global/global_variable.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/thongtinthisinhtt_model.dart';
import '../../../data/repositories/hosotrungtuyen_page_repo.dart';
import '../logicUI/trungtuyen_logic_ui.dart';
import '../models/field_filter_data_model.dart';

class TrungtuyenTable extends StatefulWidget {
  final FieldFilterDataModel fieldFilterData;
  const TrungtuyenTable({super.key, required this.fieldFilterData});

  @override
  State<TrungtuyenTable> createState() => _TrungtuyenTableState();
}

class _TrungtuyenTableState extends State<TrungtuyenTable> {
  int _currentPage = 1;
  int _pageSize = 10;
  int _totalRow = 0;
  List<TTThiSinh> _data = [];
  HosoTrungTuyenPageRepo hosoTrungTuyenPageRepo = HosoTrungTuyenPageRepo();
  late Future<dynamic> _future;

  Future<void> fetchData(
      int currentPage, int row, FieldFilterDataModel dataHeader) async {
    ThiSinhTTModel model = ThiSinhTTModel();

    //  dotdangkiId, nganhId, hoTen, ngayBd, ngayKt, maDangKy, numberPage, nguyenVongSo, status, nguoiTao, numberRow,
    model = await hosoTrungTuyenPageRepo.fetchListThongTinThiSinh(
      dataHeader.dotdangkiId,
      dataHeader.maNganh,
      dataHeader.hoTen,
      dataHeader.maHoSo,
      '$currentPage',
      dataHeader.status,
      '$row',
    );

    _data.addAll(model.danhSachs!);
    _totalRow = model.tongSoThiSinh!;
  }

  @override
  void initState() {
    _future = fetchData(_currentPage, _pageSize, widget.fieldFilterData);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TrungtuyenTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print('change');
    setState(() {
      _data = [];
      _currentPage = 1;
      _future = fetchData(_currentPage, _pageSize, widget.fieldFilterData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        // print(_totalRow);
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
            if (numbePage < _currentPage) return;
            setState(() {
              _currentPage = value ~/ _pageSize + 1;
              _future =
                  fetchData(_currentPage, _pageSize, widget.fieldFilterData);
            });
          },
          columns: const [
            DataColumn(label: TitleColumnTable(title: 'GỬI GIẤY\nBÁO TT')),
            DataColumn(label: TitleColumnTable(title: 'STATUS')),
            DataColumn(label: TitleColumnTable(title: 'MÃ HỒ\n   SƠ')),
            DataColumn(label: TitleColumnTable(title: 'SỐ BÁO\nDANH')),
            DataColumn(label: TitleColumnTable(title: 'HỌ TÊN')),
            DataColumn(label: TitleColumnTable(title: 'NGÀY SINH')),
            DataColumn(label: TitleColumnTable(title: 'GIỚI TÍNH')),
            DataColumn(label: TitleColumnTable(title: 'SỐ CMND')),
            DataColumn(label: TitleColumnTable(title: 'SĐT')),
            DataColumn(label: TitleColumnTable(title: 'EMAIL')),
            DataColumn(label: TitleColumnTable(title: 'TÊN NGÀNH\nTT')),
            DataColumn(label: TitleColumnTable(title: 'MÃ NGÀNH\nTT')),
            DataColumn(label: TitleColumnTable(title: 'TỔNG\nĐIỂM')),
            DataColumn(label: TitleColumnTable(title: 'THỨ TỰ\n N/VỌNG')),
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
  List<TTThiSinh> data;
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
      ]);
    }

    final item = data[index];
    return DataRow(
      cells: [
        DataCell(InkWell(
          splashColor: Colors.grey.shade300,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                String dateNow =
                    DateFormat('dd/MM/yyyy').format(DateTime.now());
                List<String> fieldData = [
                  dateNow,
                  '25/06/2024',
                  '01/09/2024',
                  'doanhoangphuc0@gmail.com',
                ];
                return Dialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Điền thông tin gửi',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SelectDateInput(
                          title: 'Ngày tạo',
                          onDateChanged: (value) {
                            fieldData[0] = value;
                          },
                          initValue: fieldData[0],
                        ),
                        const SizedBox(height: 5),
                        SelectDateInput(
                          title:
                              'Ngày bắt đầu nhập học đối với thí sinh đã tốt nghiệp THPT',
                          onDateChanged: (value) {
                            fieldData[1] = value;
                          },
                          initValue: fieldData[1],
                        ),
                        const SizedBox(height: 5),
                        SelectDateInput(
                          title:
                              'Ngày kết thúc nhập học đối với thí sinh đã tốt nghiệp THPT',
                          onDateChanged: (value) {
                            fieldData[2] = value;
                          },
                          initValue: fieldData[2],
                        ),
                        const SizedBox(height: 5),
                        TextFormFieldEmail(
                          onChanged: (value) {
                            fieldData[3] = value;
                          },
                          initValue: fieldData[3],
                          title: 'Nhập e-mail',
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                TrungtuyenLogicUi.sendEmailTrungTuyen(
                                  '${item.trungTuyenId}',
                                  fieldData[1],
                                  fieldData[2],
                                  fieldData[0],
                                  fieldData[3],
                                );
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Send',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Center(
            widthFactor: 2,
            child: Icon(
              Icons.forward_to_inbox_outlined,
              size: 18,
              color: Colors.blue,
            ),
          ),
        )),
        DataCell(ConstrainedColumnTable(
            child: Text(GlobalVariable
                    .fromJsonStatusHosoTrungtuyenPage['${item.status}'] ??
                ''))),
        DataCell(
            ConstrainedColumnTable(child: Text('${item.dotDangKyThiSinhId}'))),
        DataCell(ConstrainedColumnTable(child: Text(item.sbd ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.hoTen ?? ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.ngaySinh != null
                ? GlobalFunction.convertToDate(item.ngaySinh!)
                : ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.gioiTinh ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.soCmnd!))),
        DataCell(ConstrainedColumnTable(child: Text(item.dienThoai ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.email ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text(item.nganh!.tenNganh ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text(item.nganh!.maNganh ?? ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.tongDiem != null ? '${item.tongDiem}' : ''))),
        DataCell(ConstrainedColumnTable(child: Text('${item.thuTuNv}'))),
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
