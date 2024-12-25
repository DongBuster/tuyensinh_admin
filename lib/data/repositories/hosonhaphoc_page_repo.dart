import 'package:dio/dio.dart';
import '../models/dotdangki_model.dart';
import '../models/hosonhaphoc_model.dart';
import '../models/nghanh_model.dart';
import 'api_client.dart';

class HoSoNhapHocPageRepo {
  final ApiClient apiClient = ApiClient();

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

  Future<HosonhaphocModel> fetchListThongTinThiSinh(
    String dotdangkiId,
    String nganhId,
    String hoTen,
    String ngayBd,
    String ngayKt,
    String maDangKy,
    String numberPage,
    String status,
    String typeNhapHoc,
    String numberRow,
  ) async {
    String initUrl =
        'sinhviens?dotDangKyId=$dotdangkiId&nganhId=$nganhId&hoTen=$hoTen&page=$numberPage&soCmnd=$maDangKy&status=$status&rows=$numberRow&ngayBd=$ngayBd&ngayKt=$ngayKt&type=$typeNhapHoc';
    // print(initUrl);
    var response = await apiClient.getData(initUrl);
    // print(response.data);

    // GlobalFunction.checkResponse(response);
    // print(response.data.toString());
    return HosonhaphocModel.fromJson(response.data);
  }

  Future<Response> sendHosoToEmail(
    String receiveEmail,
    String sinhVienId,
  ) async {
    var response = await apiClient.getData(
        'sinhviens/sendfilenhaphoc?email=$receiveEmail&sinhVienId=$sinhVienId');
    return response;
  }
}
