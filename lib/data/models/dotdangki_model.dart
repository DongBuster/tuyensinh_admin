class DotDangKiModel {
  int? dotDangKyId;
  String? createdTime;
  String? createdBy;
  String? modifiedTime;
  String? modifiedBy;
  String? maDot;
  String? tenDot;
  String? loaiDot;
  int? heDaoTaoId;
  String? ngayBatDau;
  String? ngayKetThuc;
  String? ngayCongBo;
  int? chiTieu;
  String? dieuKien;
  int? lePhiXetTuyen;
  String? admissionStartDate;
  String? admissionEndDate;
  String? status;
  int? thuTu;
  List<dynamic>? dotDangKyNganh;
  List<dynamic>? dotDangKyThiSinh;
  List<dynamic>? nguyenVong;
  List<dynamic>? phuongAnXetTuyen;

  DotDangKiModel({
    this.dotDangKyId,
    this.createdTime,
    this.createdBy,
    this.modifiedTime,
    this.modifiedBy,
    this.maDot,
    this.tenDot,
    this.loaiDot,
    this.heDaoTaoId,
    this.ngayBatDau,
    this.ngayKetThuc,
    this.ngayCongBo,
    this.chiTieu,
    this.dieuKien,
    this.lePhiXetTuyen,
    this.admissionStartDate,
    this.admissionEndDate,
    this.status,
    this.thuTu,
    this.dotDangKyNganh,
    this.dotDangKyThiSinh,
    this.nguyenVong,
    this.phuongAnXetTuyen,
  });

  factory DotDangKiModel.fromJson(Map<String, dynamic> json) {
    return DotDangKiModel(
      dotDangKyId: json['dotDangKyId'],
      createdTime: json['createdTime'],
      createdBy: json['createdBy'],
      modifiedTime: json['modifiedTime'],
      modifiedBy: json['modifiedBy'],
      maDot: json['maDot'],
      tenDot: json['tenDot'],
      loaiDot: json['loaiDot'],
      heDaoTaoId: json['heDaoTaoId'],
      ngayBatDau: json['ngayBatDau'],
      ngayKetThuc: json['ngayKetThuc'],
      ngayCongBo: json['ngayCongBo'],
      chiTieu: json['chiTieu'],
      dieuKien: json['dieuKien'],
      lePhiXetTuyen: json['lePhiXetTuyen'],
      admissionStartDate: json['admissionStartDate'],
      admissionEndDate: json['admissionEndDate'],
      status: json['status'],
      thuTu: json['thuTu'],
      dotDangKyNganh: json['dotDangKyNganh'] ?? [],
      dotDangKyThiSinh: json['dotDangKyThiSinh'] ?? [],
      nguyenVong: json['nguyenVong'] ?? [],
      phuongAnXetTuyen: json['phuongAnXetTuyen'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dotDangKyId': dotDangKyId,
      'createdTime': createdTime,
      'createdBy': createdBy,
      'modifiedTime': modifiedTime,
      'modifiedBy': modifiedBy,
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
      'dotDangKyNganh': dotDangKyNganh,
      'dotDangKyThiSinh': dotDangKyThiSinh,
      'nguyenVong': nguyenVong,
      'phuongAnXetTuyen': phuongAnXetTuyen,
    };
  }

  DotDangKiModel copyWith({
    int? dotDangKyId,
    String? createdTime,
    String? createdBy,
    String? modifiedTime,
    String? modifiedBy,
    String? maDot,
    String? tenDot,
    String? loaiDot,
    int? heDaoTaoId,
    String? ngayBatDau,
    String? ngayKetThuc,
    String? ngayCongBo,
    int? chiTieu,
    String? dieuKien,
    int? lePhiXetTuyen,
    String? admissionStartDate,
    String? admissionEndDate,
    String? status,
    int? thuTu,
    List<dynamic>? dotDangKyNganh,
    List<dynamic>? dotDangKyThiSinh,
    List<dynamic>? nguyenVong,
    List<dynamic>? phuongAnXetTuyen,
  }) {
    return DotDangKiModel(
      dotDangKyId: dotDangKyId ?? this.dotDangKyId,
      createdTime: createdTime ?? this.createdTime,
      createdBy: createdBy ?? this.createdBy,
      modifiedTime: modifiedTime ?? this.modifiedTime,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      maDot: maDot ?? this.maDot,
      tenDot: tenDot ?? this.tenDot,
      loaiDot: loaiDot ?? this.loaiDot,
      heDaoTaoId: heDaoTaoId ?? this.heDaoTaoId,
      ngayBatDau: ngayBatDau ?? this.ngayBatDau,
      ngayKetThuc: ngayKetThuc ?? this.ngayKetThuc,
      ngayCongBo: ngayCongBo ?? this.ngayCongBo,
      chiTieu: chiTieu ?? this.chiTieu,
      dieuKien: dieuKien ?? this.dieuKien,
      lePhiXetTuyen: lePhiXetTuyen ?? this.lePhiXetTuyen,
      admissionStartDate: admissionStartDate ?? this.admissionStartDate,
      admissionEndDate: admissionEndDate ?? this.admissionEndDate,
      status: status ?? this.status,
      thuTu: thuTu ?? this.thuTu,
      dotDangKyNganh: dotDangKyNganh ?? this.dotDangKyNganh,
      dotDangKyThiSinh: dotDangKyThiSinh ?? this.dotDangKyThiSinh,
      nguyenVong: nguyenVong ?? this.nguyenVong,
      phuongAnXetTuyen: phuongAnXetTuyen ?? this.phuongAnXetTuyen,
    );
  }

  bool get hasAllNonNull {
    return dotDangKyId != null &&
        createdTime != null &&
        createdBy != null &&
        modifiedTime != null &&
        modifiedBy != null &&
        maDot != null &&
        tenDot != null &&
        loaiDot != null &&
        heDaoTaoId != null &&
        ngayBatDau != null &&
        ngayKetThuc != null &&
        ngayCongBo != null &&
        chiTieu != null &&
        dieuKien != null &&
        lePhiXetTuyen != null &&
        admissionStartDate != null &&
        admissionEndDate != null &&
        status != null &&
        thuTu != null &&
        dotDangKyNganh != null &&
        dotDangKyThiSinh != null &&
        nguyenVong != null &&
        phuongAnXetTuyen != null;
  }
}
