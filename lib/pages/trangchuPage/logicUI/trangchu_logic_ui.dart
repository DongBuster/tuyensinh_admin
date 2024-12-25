import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/models/dashboard_model.dart';
import '../models/summary_table_model.dart';

class TrangchuLogicUi {
  static Future<String> requestStoragePermission(
      DashboardModel dataDashboard) async {
    // Kiểm tra quyền truy cập
    if (await Permission.storage.request().isGranted) {
      // Quyền truy cập đã được cấp, thực hiện lưu file
      var filePath = await createExcelFile(dataDashboard);
      return filePath;
    } else if (await Permission.storage.isPermanentlyDenied) {
      // Nếu người dùng từ chối quyền vĩnh viễn, điều hướng đến cài đặt ứng dụng
      await openAppSettings();
    }
    // Nếu người dùng chỉ từ chối tạm thời, hiển thị thông báo để yêu cầu quyền lại
    print("Quyền truy cập lưu trữ đã bị từ chối.");
    return "Quyền truy cập lưu trữ đã bị từ chối.";
  }

  static Future<String> createExcelFile(DashboardModel dataDashboard) async {
    // Khởi tạo workbook
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    // Gộp các ô A1 đến F1 và thêm tiêu đề
    var mergeCell = sheetObject.merge(
        CellIndex.indexByString("A1"), CellIndex.indexByString("F1"));
    sheetObject.cell(CellIndex.indexByString("A1")).value =
        TextCellValue("Bảng tổng hợp theo ngành");

    // Thêm tiêu đề cột bắt đầu từ hàng thứ hai
    sheetObject.cell(CellIndex.indexByString("A2")).value =
        TextCellValue("STT");
    sheetObject.cell(CellIndex.indexByString("B2")).value =
        TextCellValue("Mã ngành");
    sheetObject.cell(CellIndex.indexByString("C2")).value =
        TextCellValue("Tên ngành");
    sheetObject.cell(CellIndex.indexByString("D2")).value =
        TextCellValue("Nguyện vọng");
    sheetObject.cell(CellIndex.indexByString("E2")).value =
        TextCellValue("Đăng ký (NV1)");
    sheetObject.cell(CellIndex.indexByString("F2")).value =
        TextCellValue("Trúng tuyển");
    sheetObject.cell(CellIndex.indexByString("G2")).value =
        TextCellValue("Nhập học");

    // Thêm dữ liệu bắt đầu từ hàng thứ ba
    List<SummaryTableModel> data = genarateDataSummary(dataDashboard);
    for (int i = 0; i < data.length; i++) {
      sheetObject.appendRow([
        TextCellValue('$i'),
        TextCellValue(data[i].maNganh),
        TextCellValue(data[i].tenNganh),
        TextCellValue('${data[i].soNguyenVong}'),
        TextCellValue('${data[i].soHoso}'),
        TextCellValue('${data[i].soTrungTruyen}'),
        TextCellValue('${data[i].soSinhVien}'),
      ]);
    }

    // Lưu file Excel
    // Directory directory = await getApplicationDocumentsDirectory();
    var directory =
        (await getExternalStorageDirectories(type: StorageDirectory.downloads))
            ?.first;
    String filePath = "${directory!.path}/bangtonghoptheonganh.xlsx";
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    print("File Excel được lưu tại $filePath");
    return filePath;
  }

  static List<SummaryTableModel> genarateDataSummary(DashboardModel datachart) {
    List<ReportNguyenVongByNganh> dataNguyenVongByNganh =
        datachart.reportNguyenVongByNganh!;
    List<ReportHoSoByNganh> dataHoSoByNganh = datachart.reportHoSoByNganh!;
    List<ReportTrungTuyenByNganh> dataTrungTuyenByNganh =
        datachart.reportTrungTuyenByNganh!;
    List<ReportSinhVienByNganh> dataSinhVienByNganh =
        datachart.reportSinhVienByNganh!;
    List<SummaryTableModel> data = [];

    for (int i = 0; i < dataNguyenVongByNganh.length; i++) {
      data.add(SummaryTableModel(
        maNganh: dataNguyenVongByNganh[i].maNganh!,
        tenNganh: dataNguyenVongByNganh[i].tenNganh!,
        soNguyenVong: dataHoSoByNganh
            .firstWhere((element) =>
                element.maNganh == dataNguyenVongByNganh[i].maNganh!)
            .soHoSo!,
        soHoso: dataHoSoByNganh
            .firstWhere((element) =>
                element.maNganh == dataNguyenVongByNganh[i].maNganh!)
            .soHoSo!,
        soTrungTruyen: dataTrungTuyenByNganh
            .firstWhere((element) =>
                element.maNganh == dataNguyenVongByNganh[i].maNganh!)
            .soTrungTruyen!,
        soSinhVien: dataSinhVienByNganh
            .firstWhere((element) =>
                element.maNganh == dataNguyenVongByNganh[i].maNganh!)
            .soSinhVien!,
      ));
    }
    return data;
  }
}
