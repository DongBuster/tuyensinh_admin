class NganhModel {
  final int? nganhId;
  final String? maNganh;
  final String? tenNganh;
  final int? chiTieuHb;
  final int? chiTieuThpt;
  final String? choPhepDk;
  final int? khoaId;
  final List<int>? coSoes;
  final List<NganhToHopModel>? nganhToHop;

  NganhModel({
    this.nganhId,
    this.maNganh,
    this.tenNganh,
    this.chiTieuHb,
    this.chiTieuThpt,
    this.choPhepDk,
    this.khoaId,
    this.coSoes,
    this.nganhToHop,
  });

  factory NganhModel.fromJson(Map<String, dynamic> json) {
    return NganhModel(
      nganhId: json['nganhId'] as int?,
      maNganh: json['maNganh'] as String?,
      tenNganh: json['tenNganh'] as String?,
      chiTieuHb: json['chiTieuHb'] as int?,
      chiTieuThpt: json['chiTieuThpt'] as int?,
      choPhepDk: json['choPhepDk'] as String?,
      khoaId: json['khoaId'] as int?,
      coSoes: (json['coSoes'] as List<dynamic>?)?.map((e) => e as int).toList(),
      nganhToHop: (json['nganhToHop'] as List<dynamic>?)
          ?.map((e) => NganhToHopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'coSoes': coSoes,
      'nganhToHop': nganhToHop?.map((e) => e.toJson()).toList(),
    };
  }
}

class NganhToHopModel {
  final int? nganhToHopId;
  final int? nganhId;
  final int? toHopId;
  final Nganh? nganh;

  NganhToHopModel({
    this.nganhToHopId,
    this.nganhId,
    this.toHopId,
    this.nganh,
  });

  factory NganhToHopModel.fromJson(Map<String, dynamic> json) {
    return NganhToHopModel(
      nganhToHopId: json['nganhToHopId'] as int?,
      nganhId: json['nganhId'] as int?,
      toHopId: json['toHopId'] as int?,
      nganh: json['nganh'] != null
          ? Nganh.fromJson(json['nganh'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nganhToHopId': nganhToHopId,
      'nganhId': nganhId,
      'toHopId': toHopId,
      'nganh': nganh?.toJson(),
    };
  }
}

class Nganh {
  final int? nganhId;
  final String? maNganh;
  final String? tenNganh;
  final int? chiTieuHb;
  final int? chiTieuThpt;
  final String? choPhepDk;
  final int? khoaId;
  final List<CoSoNganh>? coSoNganh;
  final List<NganhToHopModel>? nganhToHop;

  Nganh({
    this.nganhId,
    this.maNganh,
    this.tenNganh,
    this.chiTieuHb,
    this.chiTieuThpt,
    this.choPhepDk,
    this.khoaId,
    this.coSoNganh,
    this.nganhToHop,
  });

  factory Nganh.fromJson(Map<String, dynamic> json) {
    return Nganh(
      nganhId: json['nganhId'] as int?,
      maNganh: json['maNganh'] as String?,
      tenNganh: json['tenNganh'] as String?,
      chiTieuHb: json['chiTieuHb'] as int?,
      chiTieuThpt: json['chiTieuThpt'] as int?,
      choPhepDk: json['choPhepDk'] as String?,
      khoaId: json['khoaId'] as int?,
      coSoNganh: (json['coSoNganh'] as List<dynamic>?)
          ?.map((e) => CoSoNganh.fromJson(e as Map<String, dynamic>))
          .toList(),
      nganhToHop: (json['nganhToHop'] as List<dynamic>?)
          ?.map((e) => NganhToHopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'coSoNganh': coSoNganh?.map((e) => e.toJson()).toList(),
      'nganhToHop': nganhToHop?.map((e) => e.toJson()).toList(),
    };
  }
}

class CoSoNganh {
  final int? id;
  final int? coSoId;
  final int? nganhId;
  final String? status;
  final String? ghiChu;

  CoSoNganh({
    this.id,
    this.coSoId,
    this.nganhId,
    this.status,
    this.ghiChu,
  });

  factory CoSoNganh.fromJson(Map<String, dynamic> json) {
    return CoSoNganh(
      id: json['id'] as int?,
      coSoId: json['coSoId'] as int?,
      nganhId: json['nganhId'] as int?,
      status: json['status'] as String?,
      ghiChu: json['ghiChu'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'coSoId': coSoId,
      'nganhId': nganhId,
      'status': status,
      'ghiChu': ghiChu,
    };
  }
}
