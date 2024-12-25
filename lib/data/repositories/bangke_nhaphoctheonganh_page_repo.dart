import '../models/bangke_nhaphoctheonganh_model.dart';
import 'api_client.dart';

class BangkeNhaphocTheoNganhPageRepo {
  final ApiClient apiClient = ApiClient();
  Future<List<BangKeNhapHocNganhModel>> getListBangkeNhaphocTheoNganh() async {
    var response = await apiClient.getData('thutiennhaphocs/reportbynganhs');
    List<dynamic> datas = response.data;
    // print(datas);
    return datas.map((e) => BangKeNhapHocNganhModel.fromJson(e)).toList();
  }
}
