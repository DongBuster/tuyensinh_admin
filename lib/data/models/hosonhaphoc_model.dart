class HosonhaphocModel {
  int tongSoSinhVien;
  List<SinhVien> danhSachs;

  HosonhaphocModel({required this.tongSoSinhVien, required this.danhSachs});

  factory HosonhaphocModel.fromJson(Map<String, dynamic> json) {
    return HosonhaphocModel(
      tongSoSinhVien: json['tongSoSinhVien'],
      danhSachs: List<SinhVien>.from(
          json['danhSachs'].map((x) => SinhVien.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tongSoSinhVien': tongSoSinhVien,
      'danhSachs': danhSachs.map((x) => x.toJson()).toList(),
    };
  }
}

class SinhVien {
  String? maSinhVien;
  int? sinhVienId;
  DateTime? createdTime;
  TrungTuyen? trungTuyen;
  Nganh? nganh;

  SinhVien(
      {this.maSinhVien,
      this.sinhVienId,
      this.createdTime,
      this.trungTuyen,
      this.nganh});

  factory SinhVien.fromJson(Map<String, dynamic> json) {
    return SinhVien(
      maSinhVien: json['maSinhVien'],
      sinhVienId: json['sinhVienId'],
      createdTime: json['createdTime'] != null
          ? DateTime.parse(json['createdTime'])
          : null,
      trungTuyen: json['trungTuyen'] != null
          ? TrungTuyen.fromJson(json['trungTuyen'])
          : null,
      nganh: json['nganh'] != null ? Nganh.fromJson(json['nganh']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maSinhVien': maSinhVien,
      'sinhVienId': sinhVienId,
      'createdTime': createdTime?.toIso8601String(),
      'trungTuyen': trungTuyen?.toJson(),
      'nganh': nganh?.toJson(),
    };
  }
}

class TrungTuyen {
  int? trungTuyenId;
  DateTime? createdTime;
  String? createdBy;
  DateTime? modifiedTime;
  String? modifiedBy;
  int? dotDangKyThiSinhId;
  int? dotDangKyId;
  int? thiSinhId;
  String? sbd;
  String? hoTen;
  DateTime? ngaySinh;
  String? gioiTinh;
  String? soCmnd;
  String? dienThoai;
  String? email;
  String? danToc;
  String? doiTuong;
  String? khuVuc;
  String? hoKhau;
  String? diaChi;
  int? truongId;
  int? nganhId;
  int? toHopId;
  double? diem1;
  double? diem2;
  double? diem3;
  double? tongDiem;
  double? diemUtkhuVuc;
  double? diemUtdoiTuong;
  double? tongDiemXetTuyen;
  int? tieuChiPhuId;
  String? tieuChiPhu;
  int? thuTuNv;
  String? type;
  String? status;

  TrungTuyen({
    this.trungTuyenId,
    this.createdTime,
    this.createdBy,
    this.modifiedTime,
    this.modifiedBy,
    this.dotDangKyThiSinhId,
    this.dotDangKyId,
    this.thiSinhId,
    this.sbd,
    this.hoTen,
    this.ngaySinh,
    this.gioiTinh,
    this.soCmnd,
    this.dienThoai,
    this.email,
    this.danToc,
    this.doiTuong,
    this.khuVuc,
    this.hoKhau,
    this.diaChi,
    this.truongId,
    this.nganhId,
    this.toHopId,
    this.diem1,
    this.diem2,
    this.diem3,
    this.tongDiem,
    this.diemUtkhuVuc,
    this.diemUtdoiTuong,
    this.tongDiemXetTuyen,
    this.tieuChiPhuId,
    this.tieuChiPhu,
    this.thuTuNv,
    this.type,
    this.status,
  });

  factory TrungTuyen.fromJson(Map<String, dynamic> json) {
    return TrungTuyen(
      trungTuyenId: json['trungTuyenId'],
      createdTime: json['createdTime'] != null
          ? DateTime.parse(json['createdTime'])
          : null,
      createdBy: json['createdBy'],
      modifiedTime: json['modifiedTime'] != null
          ? DateTime.parse(json['modifiedTime'])
          : null,
      modifiedBy: json['modifiedBy'],
      dotDangKyThiSinhId: json['dotDangKyThiSinhId'],
      dotDangKyId: json['dotDangKyId'],
      thiSinhId: json['thiSinhId'],
      sbd: json['sbd'],
      hoTen: json['hoTen'],
      ngaySinh:
          json['ngaySinh'] != null ? DateTime.parse(json['ngaySinh']) : null,
      gioiTinh: json['gioiTinh'],
      soCmnd: json['soCmnd'],
      dienThoai: json['dienThoai'],
      email: json['email'],
      danToc: json['danToc'],
      doiTuong: json['doiTuong'],
      khuVuc: json['khuVuc'],
      hoKhau: json['hoKhau'],
      diaChi: json['diaChi'],
      truongId: json['truongId'],
      nganhId: json['nganhId'],
      toHopId: json['toHopId'],
      diem1: json['diem1']?.toDouble(),
      diem2: json['diem2']?.toDouble(),
      diem3: json['diem3']?.toDouble(),
      tongDiem: json['tongDiem']?.toDouble(),
      diemUtkhuVuc: json['diemUtkhuVuc']?.toDouble(),
      diemUtdoiTuong: json['diemUtdoiTuong']?.toDouble(),
      tongDiemXetTuyen: json['tongDiemXetTuyen']?.toDouble(),
      tieuChiPhuId: json['tieuChiPhuId'],
      tieuChiPhu: json['tieuChiPhu'],
      thuTuNv: json['thuTuNv'],
      type: json['type'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trungTuyenId': trungTuyenId,
      'createdTime': createdTime?.toIso8601String(),
      'createdBy': createdBy,
      'modifiedTime': modifiedTime?.toIso8601String(),
      'modifiedBy': modifiedBy,
      'dotDangKyThiSinhId': dotDangKyThiSinhId,
      'dotDangKyId': dotDangKyId,
      'thiSinhId': thiSinhId,
      'sbd': sbd,
      'hoTen': hoTen,
      'ngaySinh': ngaySinh?.toIso8601String(),
      'gioiTinh': gioiTinh,
      'soCmnd': soCmnd,
      'dienThoai': dienThoai,
      'email': email,
      'danToc': danToc,
      'doiTuong': doiTuong,
      'khuVuc': khuVuc,
      'hoKhau': hoKhau,
      'diaChi': diaChi,
      'truongId': truongId,
      'nganhId': nganhId,
      'toHopId': toHopId,
      'diem1': diem1,
      'diem2': diem2,
      'diem3': diem3,
      'tongDiem': tongDiem,
      'diemUtkhuVuc': diemUtkhuVuc,
      'diemUtdoiTuong': diemUtdoiTuong,
      'tongDiemXetTuyen': tongDiemXetTuyen,
      'tieuChiPhuId': tieuChiPhuId,
      'tieuChiPhu': tieuChiPhu,
      'thuTuNv': thuTuNv,
      'type': type,
      'status': status,
    };
  }
}

class Nganh {
  int? nganhId;
  String? maNganh;
  String? tenNganh;
  int? chiTieuHb;
  int? chiTieuThpt;
  String? choPhepDk;
  int? khoaId;

  Nganh({
    this.nganhId,
    this.maNganh,
    this.tenNganh,
    this.chiTieuHb,
    this.chiTieuThpt,
    this.choPhepDk,
    this.khoaId,
  });

  factory Nganh.fromJson(Map<String, dynamic> json) {
    return Nganh(
      nganhId: json['nganhId'],
      maNganh: json['maNganh'],
      tenNganh: json['tenNganh'],
      chiTieuHb: json['chiTieuHb'],
      chiTieuThpt: json['chiTieuThpt'],
      choPhepDk: json['choPhepDk'],
      khoaId: json['khoaId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nganhId': nganhId,
      'maNganh': maNganh,
      'tenNganh': tenNganh,
      'chiTieuHb': chiTieuHb,
      'chiTieuThpt': chiTieuThpt,
      'choPhepDk': choPhepDk,
      'khoaId': khoaId,
    };
  }
}
