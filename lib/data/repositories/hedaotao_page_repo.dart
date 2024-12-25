import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:dkxt_admin/data/models/hedaotao_model.dart';

import 'api_client.dart';

class HedaotaoPageRepo {
  final ApiClient apiClient = ApiClient();
  Future<List<HeDaoTaoModel>> getListHeDaoTao() async {
    var response = await apiClient.getData('hedaotaos');
    List<dynamic> datas = response.data;
    return datas.map((e) => HeDaoTaoModel.fromJson(e)).toList();
  }

  Future<void> suaHeDaoToa(HeDaoTaoModel hedaotao) async {
    var response =
        await apiClient.dio.put('hedaotaos/${hedaotao.heDaoTaoId}', data: {
      'heDaoTaoId': hedaotao.heDaoTaoId,
      'ghiChu': hedaotao.ghiChu,
      'maHeDaoTao': hedaotao.maHeDaoTao,
      'status': hedaotao.status,
      'tenHeDaoTao': hedaotao.tenHeDaoTao,
    });
    GlobalFunction.checkResponse(response);
  }

  Future<void> xoaHeDaoTao(String hedaotaoId) async {
    var response = await apiClient.getData('hedaotaos/$hedaotaoId');
    GlobalFunction.checkResponse(response);
  }
}
