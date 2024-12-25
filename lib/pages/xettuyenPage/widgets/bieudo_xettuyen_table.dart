import 'package:dkxt_admin/pages/xettuyenPage/logicUI/xettuyen_logic_ui.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/xettuyen_page_model.dart';

class BieudoThongkeXetTuyen extends StatefulWidget {
  final String dotdangkiId;
  const BieudoThongkeXetTuyen({super.key, required this.dotdangkiId});

  @override
  State<BieudoThongkeXetTuyen> createState() => _BieudoThongkeXetTuyenState();
}

class _BieudoThongkeXetTuyenState extends State<BieudoThongkeXetTuyen> {
  late Future<dynamic> _future;

  @override
  Widget build(BuildContext context) {
    _future = XettuyenLogicUi.fetchDataChart(widget.dotdangkiId);

    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Report> datachart = snapshot.data;
          List<Color> listColorChart = generateColors(datachart.length);

          return Column(
            children: [
              // note chart
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 12, 0),
                child: Wrap(
                  runSpacing: 5,
                  spacing: 10,
                  direction: Axis.horizontal,
                  children: datachart.asMap().entries.map(
                    (entry) {
                      int index = entry.key;
                      return NoteChart(
                          color: listColorChart[index],
                          name: entry.value.tenPhuongAn);
                    },
                  ).toList(),
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
                series: datachart.asMap().entries.map((entry) {
                  int index = entry.key;
                  return ColumnSeries<ThongTin, String>(
                    color: listColorChart[index],
                    dataSource: entry.value.thongTin,
                    xValueMapper: (ThongTin data, _) => data.maNganh,
                    yValueMapper: (ThongTin data, _) => data.soLuongTrungTuyen,
                  );
                }).toList(),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class NoteChart extends StatelessWidget {
  final String name;
  final Color color;
  const NoteChart({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 9,
          color: color,
          width: 24,
        ),
        const SizedBox(width: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

List<Color> generateColors(int count) {
  List<Color> colors = [];
  for (int i = 0; i < count; i++) {
    double hue =
        (i * 360 / count) % 360; // Spread hues evenly across 360 degrees
    colors.add(HSVColor.fromAHSV(1.0, hue, 0.4, 1)
        .toColor()); // Convert to Color with saturation and value
  }
  return colors;
}
