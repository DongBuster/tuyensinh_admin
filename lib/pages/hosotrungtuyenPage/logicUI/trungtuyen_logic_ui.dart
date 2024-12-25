import '../../../data/repositories/hosotrungtuyen_page_repo.dart';

class TrungtuyenLogicUi {
  static Future<List<dynamic>> fetchListData() async {
    HosoTrungTuyenPageRepo hosoTrungTuyenPageRepo = HosoTrungTuyenPageRepo();
    var listDotdangki = await hosoTrungTuyenPageRepo.fetchListDotDangkis();
    var listNganh = await hosoTrungTuyenPageRepo.fetchListNganh();

    return [
      listDotdangki,
      listNganh,
    ];
  }

  static Future<void> sendEmailTrungTuyen(
    String trungTuyenId,
    String startDateTHPT,
    String endDateTHPT,
    String createdTime,
    String email,
  ) async {
    HosoTrungTuyenPageRepo hosoTrungTuyenPageRepo = HosoTrungTuyenPageRepo();
    await hosoTrungTuyenPageRepo.sendEmail(
      trungTuyenId,
      startDateTHPT,
      endDateTHPT,
      createdTime,
      email,
    );
  }
}
