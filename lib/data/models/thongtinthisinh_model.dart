class ThongtinthisinhModel {
  int? tongSoThiSinh;
  List<ThiSinh>? danhSachs;

  ThongtinthisinhModel({this.tongSoThiSinh, this.danhSachs});

  factory ThongtinthisinhModel.fromJson(Map<String, dynamic> json) {
    return ThongtinthisinhModel(
      tongSoThiSinh: json['tongSoThiSinh'],
      danhSachs: (json['danhSachs'] as List<dynamic>?)
          ?.map((item) => ThiSinh.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tongSoThiSinh': tongSoThiSinh,
      'danhSachs': danhSachs?.map((e) => e.toJson()).toList(),
    };
  }
}

class ThiSinh {
  int? maHoSo;
  String? hoTen;
  int? thiSinhId;
  DateTime? ngaySinh;
  String? soCmnd;
  String? maDot;
  int? soNguyenVong;
  int? changeCount;
  DateTime? createdTime;
  String? createdBy;
  DateTime? modifiedTime;
  String? modifiedBy;
  int? soTienDaNop;
  String? status;
  int? dotDangKyId;
  String? regCode;
  String? email;
  String? hoTenBo;
  String? hoTenMe;
  String? sdtBo;
  String? sdtMe;
  String? gioiTinh;
  String? hoKhau;
  String? diaChi;
  String? soDienThoai;
  int? lePhi;
  String? maNganh;
  String? tenNganh;
  String? maToHop;
  String? tenToHop;
  double? diemM1k1;
  double? diemM1k2;
  double? diemM1k3;
  double? diemM1k4;
  double? diemM1k5;
  double? diemM1k6;
  double? diem1;
  double? diemM2k1;
  double? diemM2k2;
  double? diemM2k3;
  double? diemM2k4;
  double? diemM2k5;
  double? diemM2k6;
  double? diem2;
  double? diemM3k1;
  double? diemM3k2;
  double? diemM3k3;
  double? diemM3k4;
  double? diemM3k5;
  double? diemM3k6;
  double? diem3;
  double? diemXetTuyen;
  int? thuTu;
  String? maKhuVuc;
  String? maDoiTuong;
  int? lop12TruongId;
  String? maTinhLop12;
  String? maTruongTHPT;
  String? tenTruongTHPT;
  String? hocLucLop10;
  String? hanhKiemLop10;
  String? hocLucLop11;
  String? hanhKiemLop11;
  String? hocLucLop12;
  String? hanhKiemLop12;
  String? namTotNghiep;
  DateTime? ngayCap;
  String? noiCap;
  String? danToc;
  String? doiTuongXetTuyen;

  ThiSinh({
    this.maHoSo,
    this.hoTen,
    this.thiSinhId,
    this.ngaySinh,
    this.soCmnd,
    this.maDot,
    this.soNguyenVong,
    this.changeCount,
    this.createdTime,
    this.createdBy,
    this.modifiedTime,
    this.modifiedBy,
    this.soTienDaNop,
    this.status,
    this.dotDangKyId,
    this.regCode,
    this.email,
    this.hoTenBo,
    this.hoTenMe,
    this.sdtBo,
    this.sdtMe,
    this.gioiTinh,
    this.hoKhau,
    this.diaChi,
    this.soDienThoai,
    this.lePhi,
    this.maNganh,
    this.tenNganh,
    this.maToHop,
    this.tenToHop,
    this.diemXetTuyen,
    this.thuTu,
    this.maKhuVuc,
    this.maDoiTuong,
    this.lop12TruongId,
    this.maTinhLop12,
    this.maTruongTHPT,
    this.tenTruongTHPT,
    this.hocLucLop10,
    this.hanhKiemLop10,
    this.hocLucLop11,
    this.hanhKiemLop11,
    this.hocLucLop12,
    this.hanhKiemLop12,
    this.namTotNghiep,
    this.ngayCap,
    this.noiCap,
    this.danToc,
    this.doiTuongXetTuyen,
    this.diemM1k1,
    this.diemM1k2,
    this.diemM1k3,
    this.diemM1k4,
    this.diemM1k5,
    this.diemM1k6,
    this.diem1,
    this.diemM2k1,
    this.diemM2k2,
    this.diemM2k3,
    this.diemM2k4,
    this.diemM2k5,
    this.diemM2k6,
    this.diem2,
    this.diemM3k1,
    this.diemM3k2,
    this.diemM3k3,
    this.diemM3k4,
    this.diemM3k5,
    this.diemM3k6,
    this.diem3,
  });

  factory ThiSinh.fromJson(Map<String, dynamic> json) {
    return ThiSinh(
      maHoSo: json['maHoSo'],
      hoTen: json['hoTen'],
      thiSinhId: json['thiSinhId'],
      ngaySinh:
          json['ngaySinh'] != null ? DateTime.parse(json['ngaySinh']) : null,
      soCmnd: json['soCmnd'],
      maDot: json['maDot'],
      soNguyenVong: json['soNguyenVong'],
      changeCount: json['changeCount'],
      createdTime: json['createdTime'] != null
          ? DateTime.parse(json['createdTime'])
          : null,
      createdBy: json['createdBy'],
      modifiedTime: json['modifiedTime'] != null
          ? DateTime.parse(json['modifiedTime'])
          : null,
      modifiedBy: json['modifiedBy'],
      soTienDaNop: json['soTienDaNop'],
      status: json['status'],
      dotDangKyId: json['dotDangKyId'],
      regCode: json['regCode'],
      email: json['email'],
      hoTenBo: json['hoTenBo'],
      hoTenMe: json['hoTenMe'],
      sdtBo: json['sdtbo'],
      sdtMe: json['sdtme'],
      gioiTinh: json['gioiTinh'],
      hoKhau: json['hoKhau'],
      diaChi: json['diaChi'],
      soDienThoai: json['soDienThoai'],
      lePhi: json['lePhi'],
      maNganh: json['maNganh'],
      tenNganh: json['tenNganh'],
      maToHop: json['maToHop'],
      tenToHop: json['tenToHop'],
      diemXetTuyen: json['diemXetTuyen']?.toDouble(),
      thuTu: json['thuTu'],
      maKhuVuc: json['maKhuVuc'],
      maDoiTuong: json['maDoiTuong'],
      lop12TruongId: json['lop12TruongId'],
      maTinhLop12: json['maTinhLop12'],
      maTruongTHPT: json['maTruongTHPT'],
      tenTruongTHPT: json['tenTruongTHPT'],
      hocLucLop10: json['hocLucLop10'],
      hanhKiemLop10: json['hanhKiemLop10'],
      hocLucLop11: json['hocLucLop11'],
      hanhKiemLop11: json['hanhKiemLop11'],
      hocLucLop12: json['hocLucLop12'],
      hanhKiemLop12: json['hanhKiemLop12'],
      namTotNghiep: json['namTotNghiep'],
      ngayCap: json['ngayCap'] != null ? DateTime.parse(json['ngayCap']) : null,
      noiCap: json['noiCap'],
      danToc: json['danToc'],
      doiTuongXetTuyen: json['doiTuongXetTuyen'],
      diemM1k1: json['diemM1k1']?.toDouble(),
      diemM1k2: json['diemM1k2']?.toDouble(),
      diemM1k3: json['diemM1k3']?.toDouble(),
      diemM1k4: json['diemM1k4']?.toDouble(),
      diemM1k5: json['diemM1k5']?.toDouble(),
      diemM1k6: json['diemM1k6']?.toDouble(),
      diem1: json['diem1']?.toDouble(),
      diemM2k1: json['diemM2k1']?.toDouble(),
      diemM2k2: json['diemM2k2']?.toDouble(),
      diemM2k3: json['diemM2k3']?.toDouble(),
      diemM2k4: json['diemM2k4']?.toDouble(),
      diemM2k5: json['diemM2k5']?.toDouble(),
      diemM2k6: json['diemM2k6']?.toDouble(),
      diem2: json['diem2']?.toDouble(),
      diemM3k1: json['diemM3k1']?.toDouble(),
      diemM3k2: json['diemM3k2']?.toDouble(),
      diemM3k3: json['diemM3k3']?.toDouble(),
      diemM3k4: json['diemM3k4']?.toDouble(),
      diemM3k5: json['diemM3k5']?.toDouble(),
      diemM3k6: json['diemM3k6']?.toDouble(),
      diem3: json['diem3']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maHoSo': maHoSo,
      'hoTen': hoTen,
      'thiSinhId': thiSinhId,
      'ngaySinh': ngaySinh?.toIso8601String(),
      'soCmnd': soCmnd,
      'maDot': maDot,
      'soNguyenVong': soNguyenVong,
      'changeCount': changeCount,
      'createdTime': createdTime?.toIso8601String(),
      'createdBy': createdBy,
      'modifiedTime': modifiedTime?.toIso8601String(),
      'modifiedBy': modifiedBy,
      'soTienDaNop': soTienDaNop,
      'status': status,
      'dotDangKyId': dotDangKyId,
      'regCode': regCode,
      'email': email,
      'hoTenBo': hoTenBo,
      'hoTenMe': hoTenMe,
      'sdtbo': sdtBo,
      'sdtme': sdtMe,
      'gioiTinh': gioiTinh,
      'hoKhau': hoKhau,
      'diaChi': diaChi,
      'soDienThoai': soDienThoai,
      'lePhi': lePhi,
      'maNganh': maNganh,
      'tenNganh': tenNganh,
      'maToHop': maToHop,
      'tenToHop': tenToHop,
      'diemXetTuyen': diemXetTuyen,
      'thuTu': thuTu,
      'maKhuVuc': maKhuVuc,
      'maDoiTuong': maDoiTuong,
      'lop12TruongId': lop12TruongId,
      'maTinhLop12': maTinhLop12,
      'maTruongTHPT': maTruongTHPT,
      'tenTruongTHPT': tenTruongTHPT,
      'hocLucLop10': hocLucLop10,
      'hanhKiemLop10': hanhKiemLop10,
      'hocLucLop11': hocLucLop11,
      'hanhKiemLop11': hanhKiemLop11,
      'hocLucLop12': hocLucLop12,
      'hanhKiemLop12': hanhKiemLop12,
      'namTotNghiep': namTotNghiep,
      'ngayCap': ngayCap?.toIso8601String(),
      'noiCap': noiCap,
      'danToc': danToc,
      'doiTuongXetTuyen': doiTuongXetTuyen,
      'diemM1k1': diemM1k1,
      'diemM1k2': diemM1k2,
      'diemM1k3': diemM1k3,
      'diemM1k4': diemM1k4,
      'diemM1k5': diemM1k5,
      'diemM1k6': diemM1k6,
      'diem1': diem1,
      'diemM2k1': diemM2k1,
      'diemM2k2': diemM2k2,
      'diemM2k3': diemM2k3,
      'diemM2k4': diemM2k4,
      'diemM2k5': diemM2k5,
      'diemM2k6': diemM2k6,
      'diem2': diem2,
      'diemM3k1': diemM3k1,
      'diemM3k2': diemM3k2,
      'diemM3k3': diemM3k3,
      'diemM3k4': diemM3k4,
      'diemM3k5': diemM3k5,
      'diemM3k6': diemM3k6,
      'diem3': diem3,
    };
  }
}
