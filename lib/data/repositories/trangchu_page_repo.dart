import 'package:dkxt_admin/data/models/dashboard_model.dart';
import 'package:dkxt_admin/data/models/dotdangki_model.dart';

import 'api_client.dart';

class TrangchuRepo {
  final ApiClient apiClient = ApiClient();
  Future<List<DotDangKiModel>> fetchDataDotDangkis() async {
    var response = await apiClient.getData('dotdangkies');
    // print(response.data);

    List<dynamic> datas = response.data;
    return datas.map((json) => DotDangKiModel.fromJson(json)).toList();
  }

  Future<DashboardModel> fetchDataDashboard(String keyDataDashboard) async {
    var response = await apiClient
        .getData('reports/dashboard?dotDangKyId=$keyDataDashboard');
    // print(response.data.toString());
    return DashboardModel.fromJson(response.data);
  }
}
