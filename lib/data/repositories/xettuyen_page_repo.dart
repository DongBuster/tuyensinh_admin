import 'package:dio/dio.dart';
import '../models/dotdangki_model.dart';
import '../models/xettuyen_page_model.dart';
import 'api_client.dart';

class XettuyenPageRepo {
  final ApiClient apiClient = ApiClient();

  Future<List<DotDangKiModel>> fetchListDotDangkis() async {
    var response = await apiClient.getData('dotdangkies');
    List<dynamic> datas = response.data;

    return datas.map((json) => DotDangKiModel.fromJson(json)).toList();
  }

  Future<XetTuyenPageModel> fetchDataXetTuyen(String dotdangkiId) async {
    var response = await apiClient
        .getData('xettuyens?dotDangKyId=$dotdangkiId&isFirst=false');

    return XetTuyenPageModel.fromJson(response.data);
  }

  Future<XetTuyenPageModel> fetchDataTableStatistical(
      String dotdangkiId) async {
    var response = await apiClient
        .getData('xettuyens?dotDangKyId=$dotdangkiId&isFirst=false');
    return XetTuyenPageModel.fromJson(response.data);
  }

  Future<Response> duyetPhuongAnXetTuyen(
    String dotdangkiId,
    String maPhuongAn,
    bool isCongDiem,
  ) async {
    String initUrl =
        'xettuyens/phuongan/$dotdangkiId/$maPhuongAn?isCongDiem=$isCongDiem';
    var response = await apiClient.dio.post(initUrl);
    return response;
  }

  Future<Response> xoaPhuongAnXetTuyen(
    String dotdangkiId,
    String maPhuongAn,
  ) async {
    String initUrl =
        'xettuyens/phuongan?dotDangKyId=$dotdangkiId&maPhuongAn=$maPhuongAn';
    var response = await apiClient.dio.delete(initUrl);
    return response;
  }
}
