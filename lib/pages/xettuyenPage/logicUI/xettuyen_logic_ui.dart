import 'package:dio/dio.dart';
import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:dkxt_admin/data/models/xettuyen_page_model.dart';
import '../../../data/models/dotdangki_model.dart';
import '../../../data/repositories/xettuyen_page_repo.dart';

class XettuyenLogicUi {
  static XettuyenPageRepo xettuyenPageRepo = XettuyenPageRepo();
  static Future<List<DotDangKiModel>> fetchDotDangkis() async {
    List<DotDangKiModel> listDotdangki =
        await xettuyenPageRepo.fetchListDotDangkis();

    return listDotdangki;
  }

  static Future<XetTuyenPageModel> fetchDataTable(String dotdangkiId) async {
    XetTuyenPageModel xetTuyenPageModel =
        await xettuyenPageRepo.fetchDataXetTuyen(dotdangkiId);

    return xetTuyenPageModel;
  }

  static Future<List<Report>> fetchDataChart(String dotdangkiId) async {
    XetTuyenPageModel xetTuyenPageModel =
        await xettuyenPageRepo.fetchDataXetTuyen(dotdangkiId);
    List<Report> listReport = xetTuyenPageModel.reports!;

    return listReport;
  }

  static Future<List<dynamic>> fetchDataTableStatistical(
      String dotdangkiId) async {
    XetTuyenPageModel xetTuyenPageModel =
        await xettuyenPageRepo.fetchDataTableStatistical(dotdangkiId);
    List<Report> listReport = xetTuyenPageModel.reports!;

    List<ThongTinNganhXetTuyens> listThongTinNganhXetTuyens =
        xetTuyenPageModel.thongTinNganhXetTuyens!;
    // print(listReport);
    return [listReport, listThongTinNganhXetTuyens];
  }

  static Future<void> duyetPhuongAnXT(
      String dotdangkiId, String maPhuongAn, bool isCongDiem) async {
    Response response = await xettuyenPageRepo.duyetPhuongAnXetTuyen(
        dotdangkiId, maPhuongAn, isCongDiem);
    GlobalFunction.checkResponse(response);
  }

  static Future<void> xoaPhuongAnXT(
      String dotdangkiId, String maPhuongAn) async {
    Response response =
        await xettuyenPageRepo.xoaPhuongAnXetTuyen(dotdangkiId, maPhuongAn);

    GlobalFunction.checkResponse(response);
  }
}
