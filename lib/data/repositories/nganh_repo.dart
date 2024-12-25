import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:dkxt_admin/data/models/nghanh_model.dart';
import 'package:dkxt_admin/data/models/tohop_model.dart';
import '../models/khoa_model.dart';
import 'api_client.dart';

class NganhPageRepo {
  final ApiClient apiClient = ApiClient();

  Future<List<NganhModel>> getListNganh() async {
    var response = await apiClient.getData('nganhs/coso');
    List<dynamic> datas = response.data;
    return datas.map((e) => NganhModel.fromJson(e)).toList();
  }

  Future<List<KhoaModel>> getListKhoa() async {
    var response = await apiClient.getData('khoas');
    List<dynamic> datas = response.data;
    return datas.map((e) => KhoaModel.fromJson(e)).toList();
  }

  Future<List<ToHopModel>> getListToHop() async {
    var response = await apiClient.getData('tohops');
    List<dynamic> datas = response.data;
    return datas.map((e) => ToHopModel.fromJson(e)).toList();
  }

  Future<void> xoaNganh(String nganhId) async {
    var response = await apiClient.dio.delete('nganhs/$nganhId');
    GlobalFunction.alertMessage('Success', '');
    // GlobalFunction.checkResponse(response);
  }
}
