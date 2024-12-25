import '../models/bangke_kinhphinh_model.dart';
import 'api_client.dart';

class BangkeKinhphinhPageRepo {
  final ApiClient apiClient = ApiClient();
  Future<List<BangKeKinhPhiNhModel>> getListBangKeKinhPhiNh(
      String startDay, String endDay) async {
    var response = await apiClient
        .getData('thutiennhaphocs?startDay=$startDay&endDay=$endDay');
    List<dynamic> datas = response.data;
    return datas.map((e) => BangKeKinhPhiNhModel.fromJson(e)).toList();
  }
}
