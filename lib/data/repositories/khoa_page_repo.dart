import 'package:dkxt_admin/constant/global/global_function.dart';
import '../models/khoa_model.dart';
import 'api_client.dart';

class KhoaPageRepo {
  final ApiClient apiClient = ApiClient();
  Future<List<KhoaModel>> getListKhoa() async {
    var response = await apiClient.getData('khoas');
    List<dynamic> datas = response.data;
    return datas.map((e) => KhoaModel.fromJson(e)).toList();
  }

  Future<void> suaKhoa(KhoaModel khoa) async {
    var response = await apiClient.dio.put('khoas/${khoa.khoaId}', data: {
      'khoaId': khoa.khoaId,
      'nganh': khoa.nganh,
      'diaChi': khoa.diaChi,
      'dienThoai': khoa.dienThoai,
      'email': khoa.email,
      'ghiChu': khoa.ghiChu,
      'maKhoa': khoa.maKhoa,
      'status': khoa.status,
      'tenKhoa': khoa.tenKhoa,
    });
    GlobalFunction.checkResponse(response);
  }

  Future<void> xoaKhoa(String khoaId) async {
    var response = await apiClient.dio.delete('khoas/$khoaId');
    GlobalFunction.checkResponse(response);
  }
}
