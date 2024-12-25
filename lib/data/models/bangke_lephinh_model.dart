class BangKeLePhiNhModel {
  String? maSinhVien;
  String? hoTen;
  String? tenNganh;
  String? id;
  DateTime? createdTime;
  String? createdBy;
  DateTime? modifiedTime;
  String? modifiedBy;
  String? trungTuyenId;
  String? soChungTu;
  DateTime? thoiGianThu;
  double? soTien;
  double? tienKhamSk;
  double? tienBhyt;
  double? tienTheSv;
  double? tienThueGdqp;
  double? tienLePhiNh;
  double? tienKiemTraHs;
  double? tienHocPhi;
  String? ghiChu;
  int? userId;

  BangKeLePhiNhModel({
    this.maSinhVien,
    this.hoTen,
    this.tenNganh,
    this.id,
    this.createdTime,
    this.createdBy,
    this.modifiedTime,
    this.modifiedBy,
    this.trungTuyenId,
    this.soChungTu,
    this.thoiGianThu,
    this.soTien,
    this.tienKhamSk,
    this.tienBhyt,
    this.tienTheSv,
    this.tienThueGdqp,
    this.tienLePhiNh,
    this.tienKiemTraHs,
    this.tienHocPhi,
    this.ghiChu,
    this.userId,
  });

  factory BangKeLePhiNhModel.fromJson(Map<String, dynamic> json) {
    return BangKeLePhiNhModel(
      maSinhVien: json['maSinhVien'] as String?,
      hoTen: json['hoTen'] as String?,
      tenNganh: json['tenNganh'] as String?,
      id: json['id'] as String?,
      createdTime: json['createdTime'] != null
          ? DateTime.parse(json['createdTime'])
          : null,
      createdBy: json['createdBy'] as String?,
      modifiedTime: json['modifiedTime'] != null
          ? DateTime.parse(json['modifiedTime'])
          : null,
      modifiedBy: json['modifiedBy'] as String?,
      trungTuyenId: json['trungTuyenId'] as String?,
      soChungTu: json['soChungTu'] as String?,
      thoiGianThu: json['thoiGianThu'] != null
          ? DateTime.parse(json['thoiGianThu'])
          : null,
      soTien: json['soTien'] as double?,
      tienKhamSk: json['tienKhamSk'] as double?,
      tienBhyt: json['tienBhyt'] as double?,
      tienTheSv: json['tienTheSv'] as double?,
      tienThueGdqp: json['tienThueGdqp'] as double?,
      tienLePhiNh: json['tienLePhiNh'] as double?,
      tienKiemTraHs: json['tienKiemTraHs'] as double?,
      tienHocPhi: json['tienHocPhi'] as double?,
      ghiChu: json['ghiChu'] as String?,
      userId: json['userId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maSinhVien': maSinhVien,
      'hoTen': hoTen,
      'tenNganh': tenNganh,
      'id': id,
      'createdTime': createdTime?.toIso8601String(),
      'createdBy': createdBy,
      'modifiedTime': modifiedTime?.toIso8601String(),
      'modifiedBy': modifiedBy,
      'trungTuyenId': trungTuyenId,
      'soChungTu': soChungTu,
      'thoiGianThu': thoiGianThu?.toIso8601String(),
      'soTien': soTien,
      'tienKhamSk': tienKhamSk,
      'tienBhyt': tienBhyt,
      'tienTheSv': tienTheSv,
      'tienThueGdqp': tienThueGdqp,
      'tienLePhiNh': tienLePhiNh,
      'tienKiemTraHs': tienKiemTraHs,
      'tienHocPhi': tienHocPhi,
      'ghiChu': ghiChu,
      'userId': userId,
    };
  }
}
