import 'package:dkxt_admin/data/models/dotdangki_model.dart';

import '../../../data/repositories/dotdangki_page_repo.dart';
import '../models/info_dotdangki_model.dart';

class DotdangkiLogicUi {
  static Future<List<dynamic>> fetchListData() async {
    DotdangkiPageRepo dotdangkiPageRepo = DotdangkiPageRepo();
    var listDotdangki = await dotdangkiPageRepo.fetchListDotDangkis();
    var listHedaotao = await dotdangkiPageRepo.fetchListHeDaotao();
    return [listDotdangki, listHedaotao];
  }

  static List<InfoDotdangkiModel> genarateDataTable(
      List<DotDangKiModel> listData) {
    return listData.map((e) => InfoDotdangkiModel.fromJson(e)).toList();
  }
}
