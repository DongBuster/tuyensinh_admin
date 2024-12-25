import 'package:flutter/material.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/coso_model.dart';
import '../../../data/repositories/coso_page_repo.dart';

class CosoTable extends StatefulWidget {
  final List<CoSoModel> listCoso;
  const CosoTable({super.key, required this.listCoso});

  @override
  State<CosoTable> createState() => _CosoTableState();
}

class _CosoTableState extends State<CosoTable> {
  final int _pageSize = 10;

  @override
  Widget build(BuildContext context) {
    // print(widget.fieldFilterData.maNganh);

    return PaginatedDataTable(
      rowsPerPage: 7,
      dataRowMaxHeight: 65,
      columnSpacing: 14,
      horizontalMargin: 10,
      columns: const [
        DataColumn(label: TitleColumnTable(title: 'STT')),
        DataColumn(label: TitleColumnTable(title: '   MÃ \n CƠ SỞ')),
        DataColumn(label: TitleColumnTable(title: '   TÊN \n CƠ SỞ')),
        DataColumn(label: TitleColumnTable(title: 'SĐT')),
        DataColumn(label: TitleColumnTable(title: 'EMAIL')),
        DataColumn(label: TitleColumnTable(title: 'SỬA')),
        DataColumn(label: TitleColumnTable(title: 'XÓA')),
      ],
      source: _DataSource(
          data: widget.listCoso,
          totalRow: widget.listCoso.length,
          context: context),
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<CoSoModel> data;
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
      ]);
    }

    final item = data[index];
    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text('${index + 1}'))),
        DataCell(ConstrainedColumnTable(child: Text(item.maCoSo ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.tenCoSo ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.dienThoai ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.email ?? ''))),
        DataCell(InkWell(
          splashColor: Colors.grey.shade300,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                CoSoModel updateCoso = item.copyWith();
                return Dialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            'Sửa cơ sở',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFieldInput(
                            initValue: item.maCoSo ?? '',
                            title: 'Mã cơ sở',
                            onChanged: (value) {
                              updateCoso.maCoSo = value;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFieldInput(
                            initValue: item.tenCoSo ?? '',
                            title: 'Tên cơ sở',
                            onChanged: (value) {
                              updateCoso.tenCoSo = value;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFieldInput(
                            initValue: item.dienThoai ?? '',
                            title: 'Điện thoại',
                            onChanged: (value) {
                              updateCoso.dienThoai = value;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFieldInput(
                            initValue: item.email ?? '',
                            title: 'Email',
                            onChanged: (value) {
                              updateCoso.email = value;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFieldInput(
                            initValue: item.diaChi ?? '',
                            title: 'Địa chỉ',
                            onChanged: (value) {
                              updateCoso.diaChi = value;
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
                                onPressed: () async {
                                  CosoPageRepo cosoPageRepo = CosoPageRepo();
                                  await cosoPageRepo.suaCoso(updateCoso);
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
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
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.edit_document, size: 18, color: Colors.black),
        )),
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
                          'Xóa cơ sở',
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
                                CosoPageRepo cosoPageRepo = CosoPageRepo();

                                await cosoPageRepo.xoaCoso('${item.coSoId}');

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
          child: const Icon(
            Icons.delete_outline_outlined,
            size: 18,
            color: Colors.red,
          ),
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
