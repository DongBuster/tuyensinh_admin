import 'package:dio/dio.dart';
import 'package:dkxt_admin/data/models/nghanh_model.dart';
import 'package:dkxt_admin/data/models/quanhuyen_model.dart';
import 'package:dkxt_admin/data/models/thongtinthisinh_model.dart';
import '../models/dotdangki_model.dart';
import 'api_client.dart';

class HosodangkiPageRepo {
  final ApiClient apiClient = ApiClient();
  Future<dynamic> fetchNguyenvongMax() async {
    var response = await apiClient.getData('nguyenvongs/max');
    var datas = response.data;
    return datas;
  }

  Future<List<DotDangKiModel>> fetchListDotDangkis() async {
    var response = await apiClient.getData('dotdangkies');
    List<dynamic> datas = response.data;

    return datas.map((json) => DotDangKiModel.fromJson(json)).toList();
  }

  Future<List<NganhModel>> fetchListNganh() async {
    var response = await apiClient.getData('nganhs');
    List<dynamic> datas = response.data;

    return datas.map((json) => NganhModel.fromJson(json)).toList();
  }

  Future<List<QuanHuyenModel>> fetchListQuanHuyen() async {
    var response = await apiClient.getData('quanhuyens');
    List<dynamic> datas = response.data;

    return datas.map((json) => QuanHuyenModel.fromJson(json)).toList();
  }

  Future<ThongtinthisinhModel> fetchListThongTinThiSinh(
    String dotdangkiId,
    String nganhId,
    String hoTen,
    String ngayBd,
    String ngayKt,
    String maDangKy,
    String numberPage,
    String nguyenVongSo,
    String status,
    String nguoiTao,
    String numberRow,
  ) async {
    String initUrl =
        'reports/thongtinthisinh?dotDangKyId=$dotdangkiId&nganhId=$nganhId&hoTen=$hoTen&ngayBd=$ngayBd&ngayKt=$ngayKt&maDangKy=$maDangKy&page=$numberPage&nguyenVongSo=$nguyenVongSo&status=$status&nguoiTao=$nguoiTao&rows=$numberRow';
    // print(initUrl);
    var response = await apiClient.getData(initUrl);
    // GlobalFunction.checkResponse(response);
    // print(response.data.toString());
    return ThongtinthisinhModel.fromJson(response.data);
  }

  Future<Response> sendHosoToEmail(
    String regCode,
    String receiveEmail,
    bool isCreateFile,
  ) async {
    var response = await apiClient.getData(
        'dotdangkythisinhs/$regCode?mail=$receiveEmail&isReCreateFile=$isCreateFile');
    return response;
  }

  Future<Response> putSoTienDaNop(
    String maHoso,
    String soTienDaNop,
    String status,
  ) async {
    var response = await apiClient.dio.put(
      'dotdangkythisinhs/$maHoso',
      data: {
        "soTienDaNop": soTienDaNop,
        "status": status,
      },
    );
    return response;
  }

  Future<Response> deleteHoso(String maHoso) async {
    var response = await apiClient.dio.delete(
      'dotdangkythisinhs/$maHoso',
    );
    return response;
  }
}
