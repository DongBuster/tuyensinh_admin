import 'package:dkxt_admin/data/models/dotdangkinganh_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constant/global/global_widgets.dart';
import '../cubit/list_dotdangkinghanh_model_cubit.dart';

class ListDotdangkiNghanhTable extends StatefulWidget {
  List<DotdangkinganhModel> listDotDangkiNganh;

  ListDotdangkiNghanhTable({super.key, required this.listDotDangkiNganh});

  @override
  State<ListDotdangkiNghanhTable> createState() =>
      _ListDotdangkiNghanhTableState();
}

class _ListDotdangkiNghanhTableState extends State<ListDotdangkiNghanhTable> {
  late MyDataSource dataSource;
  int sortColumnIndex = 2;
  bool sortAscending = false;

  @override
  Widget build(BuildContext context) {
    dataSource = MyDataSource(
      context,
      data: widget.listDotDangkiNganh,
    );

    return PaginatedDataTable(
      columns: const [
        DataColumn(
            label: Center(
          widthFactor: 1.3,
          child: Text(
            'Chọn',
            textAlign: TextAlign.center,
          ),
        )),
        DataColumn(
            label: Center(
                widthFactor: 2,
                child: Text(
                  'Tên\nNgành',
                  textAlign: TextAlign.center,
                ))),
        DataColumn(
            label: Center(
          widthFactor: 2,
          child: Text(
            'Chỉ\ntiêu',
            textAlign: TextAlign.center,
          ),
        )),
        DataColumn(
            label: Text(
          'Max\nchỉ tiêu',
          textAlign: TextAlign.center,
        )),
        DataColumn(
            label: Text(
          'Điểm nhận\nhồ sơ',
          textAlign: TextAlign.center,
        )),
      ],
      horizontalMargin: 5,
      columnSpacing: 18,
      source: dataSource,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      rowsPerPage: 7,
      dataRowMaxHeight: 61,
    );
  }
}

class MyDataSource extends DataTableSource {
  final List<DotdangkinganhModel> data;
  final BuildContext context;
  MyDataSource(this.context, {required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    final item = data[index];

    return DataRow(cells: [
      DataCell(Checkbox(
        checkColor: Colors.white,
        value: item.duocChon,
        onChanged: (bool? value) {
          item.duocChon = value!;
          context
              .read<ListDotdangkinghanhModelCubit>()
              .update(item.dotDangKyId, item);
        },
      )),
      DataCell(
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 50,
            maxWidth: 100,
          ),
          child: Text('${item.maNganh}-${item.tenNganh}'),
        ),
      ),
      DataCell(
        QuantityInput(
          initialValue: item.chiTieu,
          onChanged: (value) {
            item.chiTieu = value;
            context
                .read<ListDotdangkinghanhModelCubit>()
                .update(item.dotDangKyId, item);
          },
        ),
      ),
      DataCell(
        QuantityInput(
          initialValue: item.maxChiTieu,
          onChanged: (value) {
            item.maxChiTieu = value;
            context
                .read<ListDotdangkinghanhModelCubit>()
                .update(item.dotDangKyId, item);
          },
        ),
      ),
      DataCell(
        QuantityPointInput(
          initialValue: item.diemNhanHoSo,
          onChanged: (value) {
            item.diemNhanHoSo = value;
            context
                .read<ListDotdangkinghanhModelCubit>()
                .update(item.dotDangKyId, item);
          },
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
}
