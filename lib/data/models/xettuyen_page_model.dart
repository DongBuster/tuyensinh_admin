class XetTuyenPageModel {
  final List<PhuongAnXetTuyens>? phuongAnXetTuyens;
  final List<Report>? reports;
  final List<ThongTinNganhXetTuyens>? thongTinNganhXetTuyens;
  final bool? isChotKetQua;

  XetTuyenPageModel({
    this.phuongAnXetTuyens,
    this.reports,
    this.thongTinNganhXetTuyens,
    this.isChotKetQua,
  });

  factory XetTuyenPageModel.fromJson(Map<String, dynamic> json) =>
      XetTuyenPageModel(
        phuongAnXetTuyens: (json['phuongAnXetTuyens'] as List<dynamic>?)
            ?.map((e) => PhuongAnXetTuyens.fromJson(e))
            .toList(),
        reports: (json['reports'] as List<dynamic>?)
            ?.map((e) => Report.fromJson(e))
            .toList(),
        thongTinNganhXetTuyens:
            (json['thongTinNganhXetTuyens'] as List<dynamic>?)
                ?.map((e) => ThongTinNganhXetTuyens.fromJson(e))
                .toList(),
        isChotKetQua: json['isChotKetQua'],
      );

  Map<String, dynamic> toJson() => {
        'phuongAnXetTuyens': phuongAnXetTuyens?.map((e) => e.toJson()).toList(),
        'reports': reports?.map((e) => e.toJson()).toList(),
        'thongTinNganhXetTuyens':
            thongTinNganhXetTuyens?.map((e) => e.toJson()).toList(),
        'isChotKetQua': isChotKetQua,
      };
}

class PhuongAnXetTuyens {
  final int? phuongAnId;
  final DateTime? createdTime;
  final String? createdBy;
  final DateTime? modifiedTime;
  final String? modifiedBy;
  final int? dotDangKyId;
  final int? nganhId;
  final String? maPhuongAn;
  final String? tenPhuongAn;
  final int? chiTieuXet;
  final double? diemXetMin;
  final int? tieuChiPhuId;
  final String? tieuChiPhu;
  final double? diemTrungTuyen;
  final int? soLuongTrungTuyen;
  final String? status;
  final String? ghiChu;
  final dynamic dotDangKy;
  final dynamic nganh;
  final dynamic tieuChiPhuNavigation;

  PhuongAnXetTuyens({
    this.phuongAnId,
    this.createdTime,
    this.createdBy,
    this.modifiedTime,
    this.modifiedBy,
    this.dotDangKyId,
    this.nganhId,
    this.maPhuongAn,
    this.tenPhuongAn,
    this.chiTieuXet,
    this.diemXetMin,
    this.tieuChiPhuId,
    this.tieuChiPhu,
    this.diemTrungTuyen,
    this.soLuongTrungTuyen,
    this.status,
    this.ghiChu,
    this.dotDangKy,
    this.nganh,
    this.tieuChiPhuNavigation,
  });

  factory PhuongAnXetTuyens.fromJson(Map<String, dynamic> json) =>
      PhuongAnXetTuyens(
        phuongAnId: json['phuongAnId'],
        createdTime: json['createdTime'] != null
            ? DateTime.parse(json['createdTime'])
            : null,
        createdBy: json['createdBy'],
        modifiedTime: json['modifiedTime'] != null
            ? DateTime.parse(json['modifiedTime'])
            : null,
        modifiedBy: json['modifiedBy'],
        dotDangKyId: json['dotDangKyId'],
        nganhId: json['nganhId'],
        maPhuongAn: json['maPhuongAn'],
        tenPhuongAn: json['tenPhuongAn'],
        chiTieuXet: json['chiTieuXet'],
        diemXetMin: json['diemXetMin']?.toDouble(),
        tieuChiPhuId: json['tieuChiPhuId'],
        tieuChiPhu: json['tieuChiPhu'],
        diemTrungTuyen: json['diemTrungTuyen']?.toDouble(),
        soLuongTrungTuyen: json['soLuongTrungTuyen'],
        status: json['status'],
        ghiChu: json['ghiChu'],
        dotDangKy: json['dotDangKy'],
        nganh: json['nganh'],
        tieuChiPhuNavigation: json['tieuChiPhuNavigation'],
      );

  Map<String, dynamic> toJson() => {
        'phuongAnId': phuongAnId,
        'createdTime': createdTime?.toIso8601String(),
        'createdBy': createdBy,
        'modifiedTime': modifiedTime?.toIso8601String(),
        'modifiedBy': modifiedBy,
        'dotDangKyId': dotDangKyId,
        'nganhId': nganhId,
        'maPhuongAn': maPhuongAn,
        'tenPhuongAn': tenPhuongAn,
        'chiTieuXet': chiTieuXet,
        'diemXetMin': diemXetMin,
        'tieuChiPhuId': tieuChiPhuId,
        'tieuChiPhu': tieuChiPhu,
        'diemTrungTuyen': diemTrungTuyen,
        'soLuongTrungTuyen': soLuongTrungTuyen,
        'status': status,
        'ghiChu': ghiChu,
        'dotDangKy': dotDangKy,
        'nganh': nganh,
        'tieuChiPhuNavigation': tieuChiPhuNavigation,
      };
}

class Report {
  final String maPhuongAn;
  final String tenPhuongAn;
  final List<ThongTin> thongTin;

  Report({
    required this.maPhuongAn,
    required this.tenPhuongAn,
    required this.thongTin,
  });

  // Factory constructor to create an instance of Report from JSON
  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      maPhuongAn: json['maPhuongAn'] as String,
      tenPhuongAn: json['tenPhuongAn'] as String,
      thongTin: (json['thongTin'] as List<dynamic>)
          .map((item) => ThongTin.fromMap(item as Map<String, dynamic>))
          .toList(),
    );
  }

  // Method to convert Report instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'maPhuongAn': maPhuongAn,
      'tenPhuongAn': tenPhuongAn,
      'thongTin': thongTin.map((item) => item.toMap()).toList(),
    };
  }
}

class ThongTin {
  final int? phuongAnId;
  final int? dotDangKyId;
  final int? nganhId;
  final String? maNganh;
  final String? maPhuongAn;
  final String? tenPhuongAn;
  final int? chiTieuXet;
  final double? diemXetMin;
  final String? tenTieuChiPhu;
  final double? tieuChiPhu;
  final double? diemTrungTuyen;
  final int? soLuongTrungTuyen;
  final String? status;
  final String? ghiChu;

  ThongTin({
    this.phuongAnId,
    this.dotDangKyId,
    this.nganhId,
    this.maNganh,
    this.maPhuongAn,
    this.tenPhuongAn,
    this.chiTieuXet,
    this.diemXetMin,
    this.tenTieuChiPhu,
    this.tieuChiPhu,
    this.diemTrungTuyen,
    this.soLuongTrungTuyen,
    this.status,
    this.ghiChu,
  });
  ThongTin.init({
    this.phuongAnId,
    this.dotDangKyId,
    this.nganhId,
    this.chiTieuXet,
    this.diemXetMin,
    this.tieuChiPhu,
    this.diemTrungTuyen,
    this.soLuongTrungTuyen,
    this.maNganh = '',
    this.maPhuongAn = '',
    this.tenPhuongAn = '',
    this.tenTieuChiPhu = '',
    this.status = '',
    this.ghiChu = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phuongAnId': phuongAnId,
      'dotDangKyId': dotDangKyId,
      'nganhId': nganhId,
      'maNganh': maNganh,
      'maPhuongAn': maPhuongAn,
      'tenPhuongAn': tenPhuongAn,
      'chiTieuXet': chiTieuXet,
      'diemXetMin': diemXetMin,
      'tenTieuChiPhu': tenTieuChiPhu,
      'tieuChiPhu': tieuChiPhu,
      'diemTrungTuyen': diemTrungTuyen,
      'soLuongTrungTuyen': soLuongTrungTuyen,
      'status': status,
      'ghiChu': ghiChu,
    };
  }

  factory ThongTin.fromMap(Map<String, dynamic> map) {
    return ThongTin(
      phuongAnId: map['phuongAnId'] != null ? map['phuongAnId'] as int : null,
      dotDangKyId:
          map['dotDangKyId'] != null ? map['dotDangKyId'] as int : null,
      nganhId: map['nganhId'] != null ? map['nganhId'] as int : null,
      maNganh: map['maNganh'] != null ? map['maNganh'] as String : null,
      maPhuongAn:
          map['maPhuongAn'] != null ? map['maPhuongAn'] as String : null,
      tenPhuongAn:
          map['tenPhuongAn'] != null ? map['tenPhuongAn'] as String : null,
      chiTieuXet: map['chiTieuXet'] != null ? map['chiTieuXet'] as int : null,
      diemXetMin:
          map['diemXetMin'] != null ? map['diemXetMin'] as double : null,
      tenTieuChiPhu:
          map['tenTieuChiPhu'] != null ? map['tenTieuChiPhu'] as String : null,
      tieuChiPhu:
          map['tieuChiPhu'] != null ? map['tieuChiPhu'] as double : null,
      diemTrungTuyen: map['diemTrungTuyen'] != null
          ? map['diemTrungTuyen'] as double
          : null,
      soLuongTrungTuyen: map['soLuongTrungTuyen'] != null
          ? map['soLuongTrungTuyen'] as int
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      ghiChu: map['ghiChu'] != null ? map['ghiChu'] as String : null,
    );
  }
}

class ThongTinNganhXetTuyens {
  final String? maNganh;
  final String? tenNganh;
  final int? nganhId;
  final List<ToHop>? toHops;
  final int? chiTieuGoc;
  final int? chiTieuXet;
  final double? diemXetMin;
  final double? diemTrungTuyen;
  final int? soLuongTrungTuyen;
  final int? tieuChiPhuId;
  final String? tieuChiPhu;
  final String? maPhuongAn;
  final String? tenPhuongAn;
  final int? phuongAnId;
  final List<MonHoc>? monHocs;

  ThongTinNganhXetTuyens({
    this.maNganh,
    this.tenNganh,
    this.nganhId,
    this.toHops,
    this.chiTieuGoc,
    this.chiTieuXet,
    this.diemXetMin,
    this.diemTrungTuyen,
    this.soLuongTrungTuyen,
    this.tieuChiPhuId,
    this.tieuChiPhu,
    this.maPhuongAn,
    this.tenPhuongAn,
    this.phuongAnId,
    this.monHocs,
  });
  factory ThongTinNganhXetTuyens.fromJson(Map<String, dynamic> json) =>
      ThongTinNganhXetTuyens(
        maNganh: json['maNganh'],
        tenNganh: json['tenNganh'],
        nganhId: json['nganhId'],
        toHops: (json['toHops'] as List<dynamic>?)
            ?.map((e) => ToHop.fromJson(e))
            .toList(),
        chiTieuGoc: json['chiTieuGoc'],
        chiTieuXet: json['chiTieuXet'],
        diemXetMin: json['diemXetMin']?.toDouble(),
        diemTrungTuyen: json['diemTrungTuyen']?.toDouble(),
        soLuongTrungTuyen: json['soLuongTrungTuyen'],
        tieuChiPhuId: json['tieuChiPhuId'],
        tieuChiPhu: json['tieuChiPhu'],
        maPhuongAn: json['maPhuongAn'],
        tenPhuongAn: json['tenPhuongAn'],
        phuongAnId: json['phuongAnId'],
        monHocs: (json['monHocs'] as List<dynamic>?)
            ?.map((e) => MonHoc.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'maNganh': maNganh,
        'tenNganh': tenNganh,
        'nganhId': nganhId,
        'toHops': toHops?.map((e) => e.toJson()).toList(),
        'chiTieuGoc': chiTieuGoc,
        'chiTieuXet': chiTieuXet,
        'diemXetMin': diemXetMin,
        'diemTrungTuyen': diemTrungTuyen,
        'soLuongTrungTuyen': soLuongTrungTuyen,
        'tieuChiPhuId': tieuChiPhuId,
        'tieuChiPhu': tieuChiPhu,
        'maPhuongAn': maPhuongAn,
        'tenPhuongAn': tenPhuongAn,
        'phuongAnId': phuongAnId,
        'monHocs': monHocs?.map((e) => e.toJson()).toList(),
      };
}

class MonHoc {
  final int? monHocId;
  final String? tenMonHoc;
  final List<dynamic>? phuongAnXetTuyen;
  final List<dynamic>? toHopMonHoc;

  MonHoc({
    this.monHocId,
    this.tenMonHoc,
    this.phuongAnXetTuyen,
    this.toHopMonHoc,
  });

  factory MonHoc.fromJson(Map<String, dynamic> json) => MonHoc(
        monHocId: json['monHocId'],
        tenMonHoc: json['tenMonHoc'],
        phuongAnXetTuyen: json['phuongAnXetTuyen'] as List<dynamic>?,
        toHopMonHoc: json['toHopMonHoc'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'monHocId': monHocId,
        'tenMonHoc': tenMonHoc,
        'phuongAnXetTuyen': phuongAnXetTuyen,
        'toHopMonHoc': toHopMonHoc,
      };
}

class ToHop {
  final int? toHopId;
  final String? maToHop;
  final String? tenToHop;
  final List<dynamic>? nganhToHop;
  final List<dynamic>? nguyenVong;
  final List<dynamic>? toHopMonHoc;

  ToHop({
    this.toHopId,
    this.maToHop,
    this.tenToHop,
    this.nganhToHop,
    this.nguyenVong,
    this.toHopMonHoc,
  });

  factory ToHop.fromJson(Map<String, dynamic> json) => ToHop(
        toHopId: json['toHopId'],
        maToHop: json['maToHop'],
        tenToHop: json['tenToHop'],
        nganhToHop: json['nganhToHop'] as List<dynamic>?,
        nguyenVong: json['nguyenVong'] as List<dynamic>?,
        toHopMonHoc: json['toHopMonHoc'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'toHopId': toHopId,
        'maToHop': maToHop,
        'tenToHop': tenToHop,
        'nganhToHop': nganhToHop,
        'nguyenVong': nguyenVong,
        'toHopMonHoc': toHopMonHoc,
      };
}
