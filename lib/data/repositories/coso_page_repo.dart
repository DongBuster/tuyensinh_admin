import 'package:dkxt_admin/constant/global/global_function.dart';
import '../models/coso_model.dart';
import 'api_client.dart';

class CosoPageRepo {
  final ApiClient apiClient = ApiClient();
  Future<List<CoSoModel>> getListCoso() async {
    var response = await apiClient.getData('cosoes');
    List<dynamic> datas = response.data;
    return datas.map((e) => CoSoModel.fromJson(e)).toList();
  }

  Future<void> suaCoso(CoSoModel coso) async {
    var response = await apiClient.dio.put('cosoes/${coso.coSoId}', data: {
      'coSoId': coso.coSoId,
      'coSoNganh': coso.coSoNganh,
      'diaChi': coso.diaChi,
      'dienThoai': coso.dienThoai,
      'email': coso.email,
      'ghiChu': coso.ghiChu,
      'maCoSo': coso.maCoSo,
      'status': coso.status,
      'tenCoSo': coso.tenCoSo,
    });
    GlobalFunction.checkResponse(response);
  }

  Future<void> xoaCoso(String cosoId) async {
    var response = await apiClient.dio.delete('cosoes/$cosoId');
    GlobalFunction.checkResponse(response);
  }
}
