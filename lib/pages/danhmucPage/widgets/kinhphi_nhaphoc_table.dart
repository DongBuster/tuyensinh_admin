import 'package:dkxt_admin/data/models/kinhphi_nhaphoc_model.dart';
import 'package:dkxt_admin/data/repositories/kinhphi_nhaphoc_page_repo.dart';
import 'package:flutter/material.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/hedaotao_model.dart';

class KinhphiNhaphocTable extends StatefulWidget {
  final List<KinhPhiNhapHocModel> listKinhphiNhapHocModel;
  final List<HeDaoTaoModel> listHeDaoTao;
  const KinhphiNhaphocTable(
      {super.key,
      required this.listHeDaoTao,
      required this.listKinhphiNhapHocModel});

  @override
  State<KinhphiNhaphocTable> createState() => _KinhphiNhaphocTableState();
}

class _KinhphiNhaphocTableState extends State<KinhphiNhaphocTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 8,
      dataRowMaxHeight: 60,
      columnSpacing: 14,
      horizontalMargin: 10,
      columns: const [
        DataColumn(label: TitleColumnTable(title: 'STT')),
        DataColumn(label: TitleColumnTable(title: 'TÊN NGÀNH')),
        DataColumn(label: TitleColumnTable(title: 'HỆ ĐÀO TẠO')),
        DataColumn(label: TitleColumnTable(title: 'TỔNG CỘNG')),
        DataColumn(label: TitleColumnTable(title: 'CHI TIẾT')),
        DataColumn(label: TitleColumnTable(title: 'XÓA')),
      ],
      source: _DataSource(
        listKinhphiNhapHocModel: widget.listKinhphiNhapHocModel,
        listHeDaoTao: widget.listHeDaoTao,
        totalRow: widget.listKinhphiNhapHocModel.length,
        context: context,
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  int totalRow;
  List<KinhPhiNhapHocModel> listKinhphiNhapHocModel;
  List<HeDaoTaoModel> listHeDaoTao;
  BuildContext context;

  _DataSource({
    required this.listKinhphiNhapHocModel,
    required this.listHeDaoTao,
    required this.totalRow,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= listKinhphiNhapHocModel.length) {
      return const DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
      ]);
    }

    final item = listKinhphiNhapHocModel[index];
    String nameHedaotao = '';
    for (var hedaotao in listHeDaoTao) {
      if (hedaotao.heDaoTaoId == item.heDaoTaoId) {
        nameHedaotao = hedaotao.tenHeDaoTao;
      }
    }
    return DataRow(
      cells: [
        DataCell(ConstrainedColumnTable(child: Text('${index + 1}'))),
        DataCell(ConstrainedColumnTable(child: Text(item.tenNganh ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text(nameHedaotao ?? ''))),
        DataCell(ConstrainedColumnTable(child: Text('${item.tongTien}' ?? ''))),
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
                          '- Hệ đào tạo: $nameHedaotao ',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Tiền học phí: ${item.tienHocPhi}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Tiền khám sức khỏe: ${item.tienKhamSk}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Tiền bảo hiểm y tế: ${item.tienBhyt}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Tiền thẻ sinh viên: ${item.tienTheSv}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Tiền thuê Giáo dục quốc phòng: ${item.tienThueGdqp}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Tiền lệ phí nhập học: ${item.tienLePhiNh}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Tiền kiểm tra hồ sơ: ${item.tienKiemTraHs}',
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
          child: const Center(
              child: Icon(Icons.info_outline, size: 18, color: Colors.blue)),
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
                            'Xóa kinh phí nhập học',
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
                                  KinhphiNhaphocPageRepo
                                      kinhphiNhaphocPageRepo =
                                      KinhphiNhaphocPageRepo();

                                  await kinhphiNhaphocPageRepo
                                      .xoaKinhPhiNhapHocNganh(item.maNganh);

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
