import '../models/bangke_lephinh_model.dart';
import 'api_client.dart';

class BangkeLephiNhPageRepo {
  final ApiClient apiClient = ApiClient();
  Future<List<BangKeLePhiNhModel>> getListBangKeLePhiNh(
      String startDay, String endDay) async {
    var response = await apiClient
        .getData('thutiennhaphocs?startDay=$startDay&endDay=$endDay');
    List<dynamic> datas = response.data;
    // print(datas);
    return datas.map((e) => BangKeLePhiNhModel.fromJson(e)).toList();
  }
}
