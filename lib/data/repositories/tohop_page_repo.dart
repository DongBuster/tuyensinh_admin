import '../../constant/global/global_function.dart';
import '../models/tohop_model.dart';
import 'api_client.dart';

class TohopPageRepo {
  final ApiClient apiClient = ApiClient();

  Future<List<ToHopModel>> getListToHop() async {
    var response = await apiClient.getData('tohops');
    List<dynamic> datas = response.data;
    return datas.map((e) => ToHopModel.fromJson(e)).toList();
  }

  Future<void> xoaToHop(String toHopId) async {
    var response = await apiClient.dio.delete('ntohops/$toHopId');
    // GlobalFunction.alertMessage('Success', '');
    GlobalFunction.checkResponse(response);
  }
}
