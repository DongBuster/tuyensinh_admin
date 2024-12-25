import 'package:flutter/material.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/doituong_model.dart';
import '../../../data/repositories/doituong_page_repo.dart';

class DoiTuongTable extends StatefulWidget {
  final List<DoiTuongUuTienModel> listDoiTuong;
  const DoiTuongTable({super.key, required this.listDoiTuong});

  @override
  State<DoiTuongTable> createState() => _DoiTuongTableState();
}

class _DoiTuongTableState extends State<DoiTuongTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 7,
      dataRowMaxHeight: 65,
      columnSpacing: 14,
      horizontalMargin: 10,
      columns: const [
        DataColumn(label: TitleColumnTable(title: 'STT')),
        DataColumn(label: TitleColumnTable(title: 'MÃ ĐỐI TƯỢNG')),
        DataColumn(label: TitleColumnTable(title: 'TÊN ĐỐI TƯỢNG')),
        DataColumn(label: TitleColumnTable(title: 'ĐIỂM ƯU TIÊN')),
        DataColumn(label: TitleColumnTable(title: 'SỬA')),
        DataColumn(label: TitleColumnTable(title: 'XÓA')),
      ],
      source: _DataSource(
          data: widget.listDoiTuong,
          totalRow: widget.listDoiTuong.length,
          context: context),
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<DoiTuongUuTienModel> data;
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
      ]);
    }

    final item = data[index];
    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text('${index + 1}'))),
        DataCell(ConstrainedColumnTable(child: Text(item.maDoiTuong ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.tenDoiTuong ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text('${item.diemUuTien}'))),
        DataCell(
          InkWell(
            splashColor: Colors.grey.shade300,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  DoiTuongUuTienModel updateDoituong = item.copyWith();

                  return Dialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
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
                              'Sửa đối tượng',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFieldInput(
                              initValue: item.maDoiTuong ?? '',
                              title: 'Mã đối tượng',
                              onChanged: (value) {
                                updateDoituong.maDoiTuong = value;
                              },
                            ),
                            const SizedBox(height: 15),
                            TextFieldInput(
                              initValue: item.tenDoiTuong ?? '',
                              title: 'Tên đối tượng',
                              onChanged: (value) {
                                updateDoituong.tenDoiTuong = value;
                              },
                            ),
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Điểm ưu tiên',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  QuantityInput(
                                    maxValue: 10,
                                    initialValue: item.diemUuTien.toInt(),
                                    onChanged: (value) {
                                      updateDoituong.diemUuTien =
                                          value.toDouble();
                                    },
                                  ),
                                ],
                              ),
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
                                    DoiTuongPageRepo doiTuongPageRepo =
                                        DoiTuongPageRepo();
                                    doiTuongPageRepo
                                        .suaDoiTuong(updateDoituong);
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
                                DoiTuongPageRepo doiTuongPageRepo =
                                    DoiTuongPageRepo();

                                await doiTuongPageRepo
                                    .xoaDoiTuong('${item.doiTuongId}');

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
