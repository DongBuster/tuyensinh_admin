import 'package:dkxt_admin/data/models/hedaotao_model.dart';
import 'package:flutter/material.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/repositories/hedaotao_page_repo.dart';

class HedaotaoTable extends StatefulWidget {
  final List<HeDaoTaoModel> listHeDaotao;
  const HedaotaoTable({super.key, required this.listHeDaotao});

  @override
  State<HedaotaoTable> createState() => _HedaotaoTableState();
}

class _HedaotaoTableState extends State<HedaotaoTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 7,
      dataRowMaxHeight: 65,
      columnSpacing: 14,
      horizontalMargin: 10,
      columns: const [
        DataColumn(label: TitleColumnTable(title: 'STT')),
        DataColumn(label: TitleColumnTable(title: 'MÃ HỆ \nĐÀO TẠO')),
        DataColumn(label: TitleColumnTable(title: 'TÊN HỆ\nĐÀO TẠO')),
        DataColumn(label: TitleColumnTable(title: 'SỬA')),
        DataColumn(label: TitleColumnTable(title: 'XÓA')),
      ],
      source: _DataSource(
          data: widget.listHeDaotao,
          totalRow: widget.listHeDaotao.length,
          context: context),
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<HeDaoTaoModel> data;
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
      ]);
    }

    final item = data[index];
    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text('${index + 1}'))),
        DataCell(ConstrainedColumnTable(child: Text(item.maHeDaoTao ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.tenHeDaoTao ?? ''))),
        DataCell(
          InkWell(
            splashColor: Colors.grey.shade300,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  HeDaoTaoModel updateHedaotao = item.copyWith();

                  return Dialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            'Sửa khoa',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFieldInput(
                            initValue: item.maHeDaoTao ?? '',
                            title: 'Mã khoa',
                            onChanged: (value) {
                              updateHedaotao.maHeDaoTao = value;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFieldInput(
                            initValue: item.tenHeDaoTao ?? '',
                            title: 'Tên khoa',
                            onChanged: (value) {
                              updateHedaotao.tenHeDaoTao = value;
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
                                  HedaotaoPageRepo hedaotaoPageRepo =
                                      HedaotaoPageRepo();
                                  hedaotaoPageRepo.suaHeDaoToa(updateHedaotao);
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
            child:
                const Icon(Icons.edit_document, size: 18, color: Colors.black),
          ),
        ),
        DataCell(InkWell(
          splashColor: Colors.grey.shade300,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
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
                          'Xóa khoa',
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.blue),
                              ),
                              onPressed: () async {
                                HedaotaoPageRepo hedaotaoPageRepo =
                                    HedaotaoPageRepo();

                                await hedaotaoPageRepo
                                    .xoaHeDaoTao('${item.heDaoTaoId}');

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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
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
          child: const Icon(Icons.delete_outline_outlined,
              size: 18, color: Colors.red),
        )),
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
