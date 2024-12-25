import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:dkxt_admin/data/models/doituong_model.dart';
import 'api_client.dart';

class DoiTuongPageRepo {
  final ApiClient apiClient = ApiClient();
  Future<List<DoiTuongUuTienModel>> getListDoiTuongUuTien() async {
    var response = await apiClient.getData('doituongs');
    List<dynamic> datas = response.data;
    return datas.map((e) => DoiTuongUuTienModel.fromJson(e)).toList();
  }

  Future<void> suaDoiTuong(DoiTuongUuTienModel doituong) async {
    var response =
        await apiClient.dio.put('doituongs/${doituong.doiTuongId}', data: {
      'doiTuongId': doituong.doiTuongId,
      'diemUuTien': doituong.diemUuTien,
      'ghiChu': doituong.ghiChu,
      'maDoiTuong': doituong.maDoiTuong,
      'status': doituong.status,
      'tenDoiTuong': doituong.tenDoiTuong,
    });
    GlobalFunction.checkResponse(response);
  }

  Future<void> xoaDoiTuong(String doiTuongId) async {
    var response = await apiClient.dio.delete('doituongs/$doiTuongId');
    GlobalFunction.checkResponse(response);
  }
}
