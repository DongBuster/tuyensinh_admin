import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:dkxt_admin/data/models/nghanh_model.dart';
import '../models/dotdangki_model.dart';
import '../models/thongtinthisinhtt_model.dart';
import 'api_client.dart';

class HosoTrungTuyenPageRepo {
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

  Future<ThiSinhTTModel> fetchListThongTinThiSinh(
    String dotdangkiId,
    String nganhId,
    String hoTen,
    String maHoso,
    String numberPage,
    String status,
    String numberRow,
  ) async {
    String initUrl =
        'trungtuyens?dotDangKyId=$dotdangkiId&nganhId=$nganhId&hoTen=$hoTen&page=$numberPage&maDangKy=$maHoso&status=$status&rows=$numberRow&createdTime=2024-11-17&startDateTHPT=2024-06-25&endDateTHPT=2024-09-01';
    // print(initUrl);
    var response = await apiClient.getData(initUrl);
    // GlobalFunction.checkResponse(response);
    // print(response.data);
    return ThiSinhTTModel.fromJson(response.data);
  }

  Future<void> sendEmail(
    String trungTuyenId,
    String startDateTHPT,
    String endDateTHPT,
    String createdTime,
    String email,
  ) async {
    await apiClient.getData(
        'trungtuyens/sendfile/$trungTuyenId?startDateTHPT=$startDateTHPT&endDateTHPT=$endDateTHPT&createdTime=$createdTime&trungTuyenId=$trungTuyenId&email=$email');
    GlobalFunction.alertMessage('Sucess', '');
  }
}
