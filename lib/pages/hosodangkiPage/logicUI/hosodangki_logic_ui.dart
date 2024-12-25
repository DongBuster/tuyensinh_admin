import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dkxt_admin/data/repositories/api_client.dart';
import '../../../constant/global/global_function.dart';
import '../../../data/repositories/hosodangki_page_repo.dart';

class HosodangkiLogicUi {
  static Future<List<dynamic>> fetchListData() async {
    HosodangkiPageRepo hosodangkiPageRepo = HosodangkiPageRepo();
    var listDotdangki = await hosodangkiPageRepo.fetchListDotDangkis();
    var listNganh = await hosodangkiPageRepo.fetchListNganh();
    var listQuanHuyen = await hosodangkiPageRepo.fetchListQuanHuyen();
    var nguyenVongMax = await hosodangkiPageRepo.fetchNguyenvongMax();
    return [
      listDotdangki,
      listNganh,
      listQuanHuyen,
      nguyenVongMax,
    ];
  }

  static Future putListDuyetHoso(List<int> listData) async {
    ApiClient apiClient = ApiClient();
    Map<String, dynamic> data = {"listChecked": listData};
    String dataJson = jsonEncode(data);
    var response =
        await apiClient.dio.put('dotdangkythisinhs/checked', data: dataJson);
    GlobalFunction.checkResponse(response);
  }

  static Future sendEmail(
      String regCode, String receiveEmail, bool isCreateFile) async {
    HosodangkiPageRepo hosodangkiPageRepo = HosodangkiPageRepo();
    hosodangkiPageRepo.sendHosoToEmail(regCode, receiveEmail, isCreateFile);
    GlobalFunction.alertMessage('Sucess', '');
    // GlobalFunction.checkResponse(response);
  }

  static Future changeSoTienDaNop(
    String maHoso,
    String soTienDaNop,
    String status,
  ) async {
    HosodangkiPageRepo hosodangkiPageRepo = HosodangkiPageRepo();
    Response response =
        await hosodangkiPageRepo.putSoTienDaNop(maHoso, soTienDaNop, status);

    GlobalFunction.checkResponse(response);
  }

  static Future xoaHoso(String maHoso) async {
    HosodangkiPageRepo hosodangkiPageRepo = HosodangkiPageRepo();
    Response response = await hosodangkiPageRepo.deleteHoso(maHoso);
    // print(response.statusCode);
    GlobalFunction.alertMessage('Sucess', '');
    // GlobalFunction.checkResponse(response);
  }
}
