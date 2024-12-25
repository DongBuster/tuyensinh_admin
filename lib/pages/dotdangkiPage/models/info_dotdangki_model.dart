import 'package:dkxt_admin/data/models/dotdangki_model.dart';

class InfoDotdangkiModel {
  int dotDangKyId;
  String maDot;
  String tenDot;
  String loaiDot;
  String status;
  int? thuTu;
  int heDaoTaoId;
  String ngayBatDau;
  String ngayKetThuc;
  String ngayCongBo;
  int? chiTieu;
  String? dieuKien;
  int? lePhiXetTuyen;
  String admissionStartDate;
  String admissionEndDate;
  InfoDotdangkiModel({
    required this.dotDangKyId,
    required this.maDot,
    required this.tenDot,
    required this.loaiDot,
    required this.status,
    required this.thuTu,
    required this.heDaoTaoId,
    required this.ngayBatDau,
    required this.ngayKetThuc,
    required this.ngayCongBo,
    this.chiTieu,
    this.dieuKien,
    this.lePhiXetTuyen,
    required this.admissionStartDate,
    required this.admissionEndDate,
  });

  factory InfoDotdangkiModel.fromJson(DotDangKiModel model) {
    return InfoDotdangkiModel(
      dotDangKyId: model.dotDangKyId ?? -1,
      maDot: model.maDot ?? '',
      tenDot: model.tenDot ?? '',
      loaiDot: model.loaiDot ?? '',
      status: model.status ?? '',
      thuTu: model.thuTu,
      heDaoTaoId: model.heDaoTaoId ?? -1,
      ngayBatDau: model.ngayBatDau ?? '',
      ngayCongBo: model.ngayCongBo ?? '',
      ngayKetThuc: model.ngayKetThuc ?? '',
      chiTieu: model.chiTieu,
      dieuKien: model.dieuKien,
      lePhiXetTuyen: model.lePhiXetTuyen,
      admissionStartDate: model.admissionStartDate ?? '',
      admissionEndDate: model.admissionEndDate ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'dotDangKyId': dotDangKyId,
      'maDot': maDot,
      'tenDot': tenDot,
      'loaiDot': loaiDot,
      'heDaoTaoId': heDaoTaoId,
      'ngayBatDau': ngayBatDau,
      'ngayKetThuc': ngayKetThuc,
      'ngayCongBo': ngayCongBo,
      'chiTieu': chiTieu,
      'dieuKien': dieuKien,
      'lePhiXetTuyen': lePhiXetTuyen,
      'admissionStartDate': admissionStartDate,
      'admissionEndDate': admissionEndDate,
      'status': status,
      'thuTu': thuTu,
    };
  }

  @override
  bool operator ==(covariant InfoDotdangkiModel other) {
    if (identical(this, other)) return true;

    return other.dotDangKyId == dotDangKyId &&
        other.maDot == maDot &&
        other.tenDot == tenDot &&
        other.loaiDot == loaiDot &&
        other.status == status &&
        other.thuTu == thuTu &&
        other.heDaoTaoId == heDaoTaoId &&
        other.ngayBatDau == ngayBatDau &&
        other.ngayKetThuc == ngayKetThuc &&
        other.ngayCongBo == ngayCongBo &&
        other.chiTieu == chiTieu &&
        other.dieuKien == dieuKien &&
        other.lePhiXetTuyen == lePhiXetTuyen &&
        other.admissionStartDate == admissionStartDate &&
        other.admissionEndDate == admissionEndDate;
  }

  @override
  int get hashCode {
    return maDot.hashCode ^
        tenDot.hashCode ^
        loaiDot.hashCode ^
        status.hashCode ^
        thuTu.hashCode ^
        heDaoTaoId.hashCode ^
        ngayBatDau.hashCode ^
        ngayKetThuc.hashCode ^
        ngayCongBo.hashCode ^
        chiTieu.hashCode ^
        dieuKien.hashCode ^
        lePhiXetTuyen.hashCode ^
        admissionStartDate.hashCode ^
        admissionEndDate.hashCode;
  }
}
