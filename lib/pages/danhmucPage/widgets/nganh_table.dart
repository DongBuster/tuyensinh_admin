import 'package:dkxt_admin/data/repositories/nganh_repo.dart';
import 'package:flutter/material.dart';
import '../../../constant/global/global_widgets.dart';
import '../model/view_nghanhpage_model.dart';

class NganhTable extends StatefulWidget {
  final List<ViewNghanhpageModel> listViewNghanhpageModel;
  const NganhTable({super.key, required this.listViewNghanhpageModel});

  @override
  State<NganhTable> createState() => _NganhTableState();
}

class _NganhTableState extends State<NganhTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 10,
      dataRowMaxHeight: 60,
      columnSpacing: 14,
      horizontalMargin: 10,
      columns: const [
        DataColumn(label: TitleColumnTable(title: 'STT')),
        DataColumn(label: TitleColumnTable(title: 'MÃ NGHÀNH')),
        DataColumn(label: TitleColumnTable(title: 'TÊN NGÀNH')),
        DataColumn(label: TitleColumnTable(title: 'CHỈ TIÊU\nHỌC BẠ')),
        DataColumn(label: TitleColumnTable(title: 'CHỈ TIÊU\nTHPT')),
        DataColumn(label: TitleColumnTable(title: 'TÊN\nKHOA')),
        DataColumn(label: TitleColumnTable(title: 'SỐ TỔ\nHỢP')),
        DataColumn(label: TitleColumnTable(title: 'ĐƯỢC\nĐK')),
        DataColumn(label: TitleColumnTable(title: 'CHI\nTIẾT')),
        DataColumn(label: TitleColumnTable(title: 'XÓA')),
      ],
      source: _DataSource(
        data: widget.listViewNghanhpageModel,
        totalRow: widget.listViewNghanhpageModel.length,
        context: context,
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<ViewNghanhpageModel> data;
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
      ]);
    }

    final item = data[index];
    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text('${index + 1}'))),
        DataCell(ConstrainedColumnTable(child: Text(item.maNganh ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.tenNganh ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text('${item.chiTieuHb}' ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text('${item.chiTieuThpt}' ''))),
        DataCell(ConstrainedColumnTable(child: Text(item.tenKhoa ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text('${item.soTohop}' ?? ''))),
        DataCell(
            ConstrainedColumnTable(child: Text(item.choPhepDk.trim() ?? ''))),
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          '${item.maNganh} - ${item.tenNganh}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Khoa: ${item.tenKhoa} ',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Chỉ tiêu học bạ: ${item.chiTieuHb}  và Chỉ tiêu THPT: ${item.chiTieuThpt}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '- Danh sách tổ hợp:',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...item.tohop.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              '* $e',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.choPhepDk.trim() == 'X'
                              ? '- Trạng thái: Cho phép đăng ký'
                              : '- Trạng thái:Không Cho phép đăng ký',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.info_outline, size: 18, color: Colors.blue),
        )),
        DataCell(
          InkWell(
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
                                  NganhPageRepo nganhPageRepo = NganhPageRepo();

                                  await nganhPageRepo.xoaNganh(item.maNganh);

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
          ),
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
