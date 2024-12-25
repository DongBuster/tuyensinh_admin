import 'package:dio/dio.dart';
import 'package:dkxt_admin/data/models/dotdangki_model.dart';
import 'package:dkxt_admin/data/models/hedaotao_model.dart';
import 'package:dkxt_admin/data/repositories/dotdangki_page_repo.dart';
import 'package:dkxt_admin/pages/dotdangkiPage/logicUI/dotdangki_logic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constant/global/global_function.dart';
import '../models/info_dotdangki_model.dart';

class ListDotdangkiTableForAdmin extends StatefulWidget {
  List<DotDangKiModel> listDotDangki;
  List<HeDaoTaoModel> listHedaotao;

  ListDotdangkiTableForAdmin(
      {super.key, required this.listDotDangki, required this.listHedaotao});

  @override
  State<ListDotdangkiTableForAdmin> createState() =>
      _ListDotdangkiTableForAdminState();
}

class _ListDotdangkiTableForAdminState
    extends State<ListDotdangkiTableForAdmin> {
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
        DataColumn(label: Text('Chọn\nngành ')),
        DataColumn(label: Text('Sửa')),
        DataColumn(label: Text('Xóa')),
      ],
      horizontalMargin: 12,
      columnSpacing: 12,
      source: dataSource,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      rowsPerPage: 6,
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
    if (index >= lisInfoDotdangki.length) return null;
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
      DataCell(
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: InkWell(
              onTap: () {
                context.go(
                  '/dotdangkiPage/selectNganhdangkiScreen',
                  extra: {
                    'dotDangKyId': '${item.dotDangKyId}',
                    'title': item.tenDot,
                  },
                );
              },
              child: const Icon(Icons.list, size: 25, color: Colors.black)),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: InkWell(
            onTap: () async {
              DotDangKiModel dangKiModel = listDotDangki.firstWhere(
                  (element) => element.dotDangKyId == item.dotDangKyId);
              DotDangKiModel dangKiModelCopy = dangKiModel.copyWith();

              context.go('/dotdangkiPage/editDotdangkiScreen', extra: {
                'title': item.tenDot,
                'listHedaotao': listHedaotao,
                'dotdangkimodel': dangKiModelCopy,
              });
            },
            child: const Icon(
              Icons.edit_document,
              size: 25,
              color: Colors.black,
            ),
          ),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: InkWell(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            const Icon(
                              Icons.error_outline_outlined,
                              size: 70,
                              color: Colors.amber,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Xóa đợt đăng kí',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Bạn có chắc chắn muốn ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              'xóa không?',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  style: const ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      BeveledRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.blue),
                                  ),
                                  onPressed: () async {
                                    DotdangkiPageRepo dotdangkiPageRepo =
                                        DotdangkiPageRepo();
                                    Response response = await dotdangkiPageRepo
                                        .deleteDotdangki('${item.dotDangKyId}');
                                    GlobalFunction.checkResponse(response);

                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text(
                                    'Đồng ý',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  style: const ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      BeveledRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.blue),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Thoát',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
              child: const Icon(Icons.delete_outline_rounded,
                  size: 25, color: Colors.red)),
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => lisInfoDotdangki.length; // Trả về số lượng dòng
  @override
  int get selectedRowCount => 0;
}
