import 'package:dkxt_admin/data/models/hosonhaphoc_model.dart';
import 'package:dkxt_admin/pages/hosonhaphocPage/logicUI/hosonhaphoc_logic_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/repositories/hosonhaphoc_page_repo.dart';
import '../models/field_filter_data_model.dart';

class HoSoNhapHocTable extends StatefulWidget {
  final FieldFilterDataModel fieldFilterData;
  const HoSoNhapHocTable({super.key, required this.fieldFilterData});

  @override
  State<HoSoNhapHocTable> createState() => _HoSoNhapHocTableState();
}

class _HoSoNhapHocTableState extends State<HoSoNhapHocTable> {
  int _currentPage = 1;
  final int _pageSize = 10;
  int _totalRow = 0;
  List<SinhVien> _data = [];
  HoSoNhapHocPageRepo hoSoNhapHocPageRepo = HoSoNhapHocPageRepo();
  late Future<dynamic> _future;
  @override
  void initState() {
    super.initState();
    _future = fetchData(_currentPage, _pageSize, widget.fieldFilterData);
  }

  Future<void> fetchData(
      int currentPage, int row, FieldFilterDataModel dataHeader) async {
    HosonhaphocModel model = HosonhaphocModel(danhSachs: [], tongSoSinhVien: 0);

    //  dotdangkiId, nganhId, hoTen, ngayBd, ngayKt, maDangKy, numberPage, nguyenVongSo, status, nguoiTao, numberRow,
    model = await hoSoNhapHocPageRepo.fetchListThongTinThiSinh(
      dataHeader.dotdangkiId,
      dataHeader.maNganh,
      dataHeader.hoTen,
      dataHeader.createdTime,
      dataHeader.endTime,
      dataHeader.maHoSo,
      '$currentPage',
      dataHeader.status,
      dataHeader.type,
      '$row',
    );

    _data.addAll(model.danhSachs);
    _totalRow = model.tongSoSinhVien;
  }

  @override
  void didUpdateWidget(covariant HoSoNhapHocTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _currentPage = 1;
      _data = [];
      _future = fetchData(_currentPage, _pageSize, widget.fieldFilterData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        // print(snapshot.data);

        return PaginatedDataTable(
          rowsPerPage: _pageSize,
          // availableRowsPerPage: const [10, 20],
          dataRowMaxHeight: 65,
          columnSpacing: 14,
          horizontalMargin: 10,
          // onRowsPerPageChanged: (value) {
          //   setState(() {
          //     _pageSize = value!;
          //   });
          // },
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
            DataColumn(label: TitleColumnTable(title: 'TÁC VỤ')),
            DataColumn(label: TitleColumnTable(title: 'MÃ HỒ\n   SƠ')),
            DataColumn(label: TitleColumnTable(title: 'SỐ BÁO\nDANH')),
            DataColumn(label: TitleColumnTable(title: 'MÃ SINH\n   VIÊN')),
            DataColumn(label: TitleColumnTable(title: 'HỌ TÊN')),
            DataColumn(label: TitleColumnTable(title: 'NGÀY SINH')),
            DataColumn(label: TitleColumnTable(title: 'GIỚI TÍNH')),
            DataColumn(label: TitleColumnTable(title: 'SỐ CMND')),
            DataColumn(label: TitleColumnTable(title: 'SĐT')),
            DataColumn(label: TitleColumnTable(title: 'EMAIL')),
            DataColumn(label: TitleColumnTable(title: 'TÊN NGÀNH\n T/TUYỂN')),
            DataColumn(label: TitleColumnTable(title: 'MÃ NGÀNH\n T/TUYỂN')),
            DataColumn(label: TitleColumnTable(title: 'TỔNG ĐIỂM')),
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
  List<SinhVien> data;
  BuildContext context;

  _DataSource(
      {required this.data, required this.totalRow, required this.context});

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

    final item = data[index];
    return DataRow(
      cells: [
        DataCell(
          InkWell(
            splashColor: Colors.grey.shade300,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  String initReceiveEmail = 'phamdung150603@gmail.com';

                  return Dialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            'Thông tin email nhận file',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormFieldEmail(
                            title: 'Email nhận',
                            initValue: initReceiveEmail,
                            onChanged: (value) {
                              initReceiveEmail = value;
                            },
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
                                  HosoNhapHocLogicUi.sendEmail(
                                    initReceiveEmail,
                                    '${item.sinhVienId}',
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
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Icon(
              Icons.forward_to_inbox_outlined,
              size: 20,
              color: Colors.blue.shade300,
            ),
          ),
        ),
        DataCell(ConstrainedColumnTable(
            child: Text('${item.trungTuyen?.dotDangKyThiSinhId ?? ''}'))),
        DataCell(
            ConstrainedColumnTable(child: Text(item.trungTuyen?.sbd ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.maSinhVien ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text(item.trungTuyen?.hoTen ?? ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.trungTuyen?.ngaySinh != null
                ? DateFormat('dd/MM/yyyy').format(item.trungTuyen!.ngaySinh!)
                : ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.trungTuyen?.gioiTinh ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text(item.trungTuyen?.soCmnd ?? ''))),
        DataCell(ConstrainedColumnTable(
            child: Text(item.trungTuyen?.dienThoai ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text(item.trungTuyen?.email ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text(item.nganh?.tenNganh ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text(item.nganh?.maNganh ?? ''))),
        DataCell(ConstrainedColumnTable(
            child: Text('${item.trungTuyen?.tongDiem ?? ''}'))),
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
