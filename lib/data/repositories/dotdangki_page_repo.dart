import 'package:dio/dio.dart';
import 'package:dkxt_admin/data/models/dotdangkinganh_model.dart';
import 'package:dkxt_admin/data/repositories/api_client.dart';

import '../models/dotdangki_model.dart';
import '../models/hedaotao_model.dart';

class DotdangkiPageRepo {
  final ApiClient apiClient = ApiClient();

  Future<List<DotDangKiModel>> fetchListDotDangkis() async {
    var response = await apiClient.getData('dotdangkies');
    List<dynamic> datas = response.data;

    return datas.map((json) => DotDangKiModel.fromJson(json)).toList();
  }

  Future<List<HeDaoTaoModel>> fetchListHeDaotao() async {
    var response = await apiClient.getData('hedaotaos');
    List<dynamic> datas = response.data;

    return datas.map((json) => HeDaoTaoModel.fromJson(json)).toList();
  }

  Future<List<DotdangkinganhModel>> fetchListDotdangkiNganh(String id) async {
    var response = await apiClient.getData('dotdangkynganhs/$id');
    // print(response.data);
    List<dynamic> datas = response.data;

    return datas.map((json) => DotdangkinganhModel.fromJson(json)).toList();
  }

  Future<Response> updateDotdangkiNghanh(
      List<DotdangkinganhModel> list, int dotdangki) async {
    List<Map<String, dynamic>> data = list.map((e) => e.toJson()).toList();
    Response response =
        await apiClient.dio.put('dotdangkynganhs/$dotdangki', data: data);
    return response;
  }

  Future<Response> updateDotdangki(DotDangKiModel model) async {
    Response response = await apiClient.dio
        .put('dotdangkies/${model.dotDangKyId}', data: model.toJson());
    return response;
  }

  Future<Response> postDotdangki(Map<String, dynamic> data) async {
    Response response = await apiClient.dio.post('dotdangkies', data: data);
    return response;
  }

  Future<Response> deleteDotdangki(String id) async {
    Response response = await apiClient.dio.delete('dotdangkies/$id');

    return response;
  }
}
