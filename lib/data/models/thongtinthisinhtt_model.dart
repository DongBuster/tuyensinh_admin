

class ThiSinhTTModel {
  int? tongSoThiSinh;
  List<TTThiSinh>? danhSachs;

  ThiSinhTTModel({
    this.tongSoThiSinh,
    this.danhSachs,
  });

  factory ThiSinhTTModel.fromJson(Map<String, dynamic> json) {
    return ThiSinhTTModel(
      tongSoThiSinh: json['tongSoThiSinh'],
      danhSachs: List<TTThiSinh>.from(
          json['danhSachs'].map((x) => TTThiSinh.fromJson(x))),
    );
  }
}

class TTThiSinh {
  int? trungTuyenId;
  String? createdTime;
  String? createdBy;
  String? modifiedTime;
  String? modifiedBy;
  int? dotDangKyThiSinhId;
  int? dotDangKyId;
  int? thiSinhId;
  String? sbd;
  String? hoTen;
  String? ngaySinh;
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
  String? maToHop;
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
  DotDangKyThiSinh? dotDangKyThiSinh;
  Nganh? nganh;

  TTThiSinh({
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
    this.maToHop,
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
    this.dotDangKyThiSinh,
    this.nganh,
  });

  factory TTThiSinh.fromJson(Map<String, dynamic> json) {
    return TTThiSinh(
      trungTuyenId: json['trungTuyenId'],
      createdTime: json['createdTime'],
      createdBy: json['createdBy'],
      modifiedTime: json['modifiedTime'],
      modifiedBy: json['modifiedBy'],
      dotDangKyThiSinhId: json['dotDangKyThiSinhId'],
      dotDangKyId: json['dotDangKyId'],
      thiSinhId: json['thiSinhId'],
      sbd: json['sbd'] ?? '',
      hoTen: json['hoTen'],
      ngaySinh: json['ngaySinh'],
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
      maToHop: json['maToHop'],
      diem1: json['diem1'] as double?,
      diem2: json['diem2'] as double?,
      diem3: json['diem3'] as double?,
      tongDiem: json['tongDiem'] as double?,
      diemUtkhuVuc: json['diemUtkhuVuc'] as double?,
      diemUtdoiTuong: json['diemUtdoiTuong'] as double?,
      tongDiemXetTuyen: json['tongDiemXetTuyen'] as double?,
      tieuChiPhuId: json['tieuChiPhuId'],
      tieuChiPhu: json['tieuChiPhu'],
      thuTuNv: json['thuTuNv'],
      type: json['type'],
      status: json['status'],
      dotDangKyThiSinh: DotDangKyThiSinh.fromJson(json['dotDangKyThiSinh']),
      nganh: Nganh.fromJson(json['nganh']),
    );
  }
}

class DotDangKyThiSinh {
  int? id;
  String? createdTime;
  String? createdBy;
  String? modifiedTime;
  String? modifiedBy;
  String? checkedTime;
  String? checkedBy;
  int? dotDangKyId;
  int? thiSinhId;
  String? regCode;
  double? soTienDaNop;
  int? changeCount;
  String? doiTuongXetTuyen;
  String? namTotNghiepThpt;
  String? fileKetQuaThi;
  String? fileMinhChung;
  String? loaiChungChi;
  double? diemChungChi;
  String? status;
  String? fileMinhChungThanhToan;

  DotDangKyThiSinh({
    this.id,
    this.createdTime,
    this.createdBy,
    this.modifiedTime,
    this.modifiedBy,
    this.checkedTime,
    this.checkedBy,
    this.dotDangKyId,
    this.thiSinhId,
    this.regCode,
    this.soTienDaNop,
    this.changeCount,
    this.doiTuongXetTuyen,
    this.namTotNghiepThpt,
    this.fileKetQuaThi,
    this.fileMinhChung,
    this.loaiChungChi,
    this.diemChungChi,
    this.status,
    this.fileMinhChungThanhToan,
  });

  factory DotDangKyThiSinh.fromJson(Map<String, dynamic> json) {
    return DotDangKyThiSinh(
      id: json['id'],
      createdTime: json['createdTime'],
      createdBy: json['createdBy'],
      modifiedTime: json['modifiedTime'],
      modifiedBy: json['modifiedBy'],
      checkedTime: json['checkedTime'],
      checkedBy: json['checkedBy'],
      dotDangKyId: json['dotDangKyId'],
      thiSinhId: json['thiSinhId'],
      regCode: json['regCode'],
      soTienDaNop: json['soTienDaNop'] as double?,
      changeCount: json['changeCount'],
      doiTuongXetTuyen: json['doiTuongXetTuyen'],
      namTotNghiepThpt: json['namTotNghiepThpt'],
      fileKetQuaThi: json['fileKetQuaThi'],
      fileMinhChung: json['fileMinhChung'],
      loaiChungChi: json['loaiChungChi'],
      diemChungChi: json['diemChungChi'] as double?,
      status: json['status'],
      fileMinhChungThanhToan: json['fileMinhChungThanhToan'],
    );
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
  dynamic khoa;
  List<dynamic>? coSoNganh;
  List<dynamic>? dotDangKyNganh;
  List<dynamic>? lop;
  List<dynamic>? nganhToHop;
  List<dynamic>? nguyenVong;
  List<dynamic>? phuongAnXetTuyen;
  List<TrungTuyen>? trungTuyen;
  List<dynamic>? userNganh;

  Nganh({
    this.nganhId,
    this.maNganh,
    this.tenNganh,
    this.chiTieuHb,
    this.chiTieuThpt,
    this.choPhepDk,
    this.khoaId,
    this.khoa,
    this.coSoNganh,
    this.dotDangKyNganh,
    this.lop,
    this.nganhToHop,
    this.nguyenVong,
    this.phuongAnXetTuyen,
    this.trungTuyen,
    this.userNganh,
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
      khoa: json['khoa'],
      coSoNganh: List<dynamic>.from(json['coSoNganh'] ?? []),
      dotDangKyNganh: List<dynamic>.from(json['dotDangKyNganh'] ?? []),
      lop: List<dynamic>.from(json['lop'] ?? []),
      nganhToHop: List<dynamic>.from(json['nganhToHop'] ?? []),
      nguyenVong: List<dynamic>.from(json['nguyenVong'] ?? []),
      phuongAnXetTuyen: List<dynamic>.from(json['phuongAnXetTuyen'] ?? []),
      trungTuyen: List<TrungTuyen>.from(
          json['trungTuyen'].map((x) => TrungTuyen.fromJson(x))),
      userNganh: List<dynamic>.from(json['userNganh'] ?? []),
    );
  }
}

class TrungTuyen {
  int? trungTuyenId;
  String? createdTime;
  String? createdBy;
  String? modifiedTime;
  String? modifiedBy;
  int? dotDangKyThiSinhId;
  int? dotDangKyId;
  int? thiSinhId;
  String? sbd;
  String? hoTen;
  String? ngaySinh;
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
  String? maToHop;
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
    this.maToHop,
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
      createdTime: json['createdTime'],
      createdBy: json['createdBy'],
      modifiedTime: json['modifiedTime'],
      modifiedBy: json['modifiedBy'],
      dotDangKyThiSinhId: json['dotDangKyThiSinhId'],
      dotDangKyId: json['dotDangKyId'],
      thiSinhId: json['thiSinhId'],
      sbd: json['sbd'] ?? '',
      hoTen: json['hoTen'],
      ngaySinh: json['ngaySinh'],
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
      maToHop: json['maToHop'],
      diem1: json['diem1'] as double?,
      diem2: json['diem2'] as double?,
      diem3: json['diem3'] as double?,
      tongDiem: json['tongDiem'] as double?,
      diemUtkhuVuc: json['diemUtkhuVuc'] as double?,
      diemUtdoiTuong: json['diemUtdoiTuong'] as double?,
      tongDiemXetTuyen: json['tongDiemXetTuyen'] as double?,
      tieuChiPhuId: json['tieuChiPhuId'],
      tieuChiPhu: json['tieuChiPhu'],
      thuTuNv: json['thuTuNv'],
      type: json['type'],
      status: json['status'],
    );
  }
}
