import 'package:dkxt_admin/data/models/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'note_chart.dart';

class Chart extends StatefulWidget {
  final DashboardModel datachart;
  const Chart({super.key, required this.datachart});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    List<ReportNguyenVongByNganh> dataNguyenVongByNganh =
        widget.datachart.reportNguyenVongByNganh!;
    List<ReportHoSoByNganh> dataHoSoByNganh =
        widget.datachart.reportHoSoByNganh!;
    List<ReportTrungTuyenByNganh> dataTrungTuyenByNganh =
        widget.datachart.reportTrungTuyenByNganh!;
    List<ReportSinhVienByNganh> dataSinhVienByNganh =
        widget.datachart.reportSinhVienByNganh!;
    // print(MediaQuery.of(context).size.width);
    return Column(
      children: [
        // note chart
        const Padding(
          padding: EdgeInsets.fromLTRB(14, 0, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NoteChart(color: Color(0xff8BC34A), name: 'Nguyện vọng'),
              NoteChart(color: Color(0xffFFEB3B), name: 'Trúng tuyển'),
              NoteChart(color: Color(0xffFF9800), name: 'Đăng kí (NV1)'),
              NoteChart(color: Colors.blue, name: 'Nhập học'),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SfCartesianChart(
            primaryXAxis: CategoryAxis(
              autoScrollingDelta:
                  MediaQuery.of(context).size.width > 360 ? 7 : 5,
              autoScrollingMode: AutoScrollingMode.start,
            ),
            zoomPanBehavior: ZoomPanBehavior(
              enablePanning: true,
              enablePinching: true,
              enableDoubleTapZooming: false,
            ),
            series: [
              ColumnSeries<ReportNguyenVongByNganh, String>(
                // Bind data source
                color: const Color(0xff8BC34A),
                dataSource: dataNguyenVongByNganh,
                xValueMapper: (ReportNguyenVongByNganh data, _) => data.maNganh,
                yValueMapper: (ReportNguyenVongByNganh data, _) =>
                    data.soNguyenVong,
              ),
              ColumnSeries<ReportTrungTuyenByNganh, String>(
                // Bind data source
                color: const Color(0xffFFEB3B),

                dataSource: dataTrungTuyenByNganh,
                xValueMapper: (ReportTrungTuyenByNganh data, _) => data.maNganh,
                yValueMapper: (ReportTrungTuyenByNganh data, _) =>
                    data.soTrungTruyen,
              ),
              ColumnSeries<ReportHoSoByNganh, String>(
                // Bind data source
                color: const Color(0xffFF9800),

                dataSource: dataHoSoByNganh,
                xValueMapper: (ReportHoSoByNganh data, _) => data.maNganh,
                yValueMapper: (ReportHoSoByNganh data, _) => data.soHoSo,
              ),
              ColumnSeries<ReportSinhVienByNganh, String>(
                // Bind data source
                color: Colors.blue,

                dataSource: dataSinhVienByNganh,
                xValueMapper: (ReportSinhVienByNganh data, _) => data.maNganh,
                yValueMapper: (ReportSinhVienByNganh data, _) =>
                    data.soSinhVien,
              ),
            ]),
      ],
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales, this.a, this.b, this.c);

  final String year;
  final double sales;
  final double a;
  final double b;
  final double c;
}
