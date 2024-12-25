import 'dart:convert';
import 'package:dkxt_admin/data/repositories/api_client.dart';
import '../../../constant/global/global_function.dart';
import '../../../data/repositories/hosonhaphoc_page_repo.dart';

class HosoNhapHocLogicUi {
  static Future<List<dynamic>> fetchListData() async {
    HoSoNhapHocPageRepo hoSoNhapHocPageRepo = HoSoNhapHocPageRepo();
    var listDotdangki = await hoSoNhapHocPageRepo.fetchListDotDangkis();
    var listNganh = await hoSoNhapHocPageRepo.fetchListNganh();
    return [
      listDotdangki,
      listNganh,
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

  static Future sendEmail(String sinhVienId, String receiveEmail) async {
    HoSoNhapHocPageRepo hoSoNhapHocPageRepo = HoSoNhapHocPageRepo();

    await hoSoNhapHocPageRepo.sendHosoToEmail(receiveEmail, sinhVienId);
    GlobalFunction.alertMessage('Sucess', '');
  }
}
