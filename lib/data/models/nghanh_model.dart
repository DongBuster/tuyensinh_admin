class NganhModel {
  int? nganhId;
  String? maNganh;
  String? tenNganh;
  int? chiTieuHb;
  int? chiTieuThpt;
  String? choPhepDk;
  int? khoaId;
  String? khoa;
  List<dynamic>? coSoNganh;
  List<dynamic>? dotDangKyNganh;
  List<dynamic>? lop;
  List<NganhToHop>? nganhToHop;
  List<dynamic>? nguyenVong;
  List<dynamic>? phuongAnXetTuyen;
  List<dynamic>? trungTuyen;
  List<dynamic>? userNganh;

  NganhModel({
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

  factory NganhModel.fromJson(Map<String, dynamic> json) {
    return NganhModel(
      nganhId: json['nganhId'],
      maNganh: json['maNganh'],
      tenNganh: json['tenNganh'],
      chiTieuHb: json['chiTieuHb'],
      chiTieuThpt: json['chiTieuThpt'],
      choPhepDk: json['choPhepDk'],
      khoaId: json['khoaId'],
      khoa: json['khoa'],
      coSoNganh: json['coSoNganh'] ?? [],
      dotDangKyNganh: json['dotDangKyNganh'] ?? [],
      lop: json['lop'] ?? [],
      nganhToHop: (json['nganhToHop'] as List<dynamic>?)
          ?.map((e) => NganhToHop.fromJson(e))
          .toList(),
      nguyenVong: json['nguyenVong'] ?? [],
      phuongAnXetTuyen: json['phuongAnXetTuyen'] ?? [],
      trungTuyen: json['trungTuyen'] ?? [],
      userNganh: json['userNganh'] ?? [],
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
      'khoa': khoa,
      'coSoNganh': coSoNganh,
      'dotDangKyNganh': dotDangKyNganh,
      'lop': lop,
      'nganhToHop': nganhToHop?.map((e) => e.toJson()).toList(),
      'nguyenVong': nguyenVong,
      'phuongAnXetTuyen': phuongAnXetTuyen,
      'trungTuyen': trungTuyen,
      'userNganh': userNganh,
    };
  }
}

class NganhToHop {
  int? nganhToHopId;
  int? nganhId;
  int? toHopId;
  int? toHop;

  NganhToHop({
    this.nganhToHopId,
    this.nganhId,
    this.toHopId,
    this.toHop,
  });

  factory NganhToHop.fromJson(Map<String, dynamic> json) {
    return NganhToHop(
      nganhToHopId: json['nganhToHopId'],
      nganhId: json['nganhId'],
      toHopId: json['toHopId'],
      toHop: json['toHop'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nganhToHopId': nganhToHopId,
      'nganhId': nganhId,
      'toHopId': toHopId,
      'toHop': toHop,
    };
  }
}
