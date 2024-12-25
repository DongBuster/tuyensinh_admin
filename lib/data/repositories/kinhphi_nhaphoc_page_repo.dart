import '../../constant/global/global_function.dart';
import '../models/hedaotao_model.dart';
import '../models/kinhphi_nhaphoc_model.dart';
import 'api_client.dart';

class KinhphiNhaphocPageRepo {
  final ApiClient apiClient = ApiClient();
  Future<List<KinhPhiNhapHocModel>> getListKinhPhiNhapHoc() async {
    var response = await apiClient.getData('kinhphinhaphocs');
    List<dynamic> datas = response.data;
    return datas.map((e) => KinhPhiNhapHocModel.fromJson(e)).toList();
  }

  Future<List<HeDaoTaoModel>> getListHeDaoTao() async {
    var response = await apiClient.getData('hedaotaos');
    List<dynamic> datas = response.data;
    return datas.map((e) => HeDaoTaoModel.fromJson(e)).toList();
  }

  Future<void> xoaKinhPhiNhapHocNganh(String nganhId) async {
    var response = await apiClient.dio.delete('kinhphinhaphocs/$nganhId');
    GlobalFunction.checkResponse(response);
  }
}
