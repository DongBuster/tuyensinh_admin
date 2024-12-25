class DashboardModel {
  ThongTinChung? thongTinChung;
  List<ReportNguyenVongByNganh>? reportNguyenVongByNganh;
  List<ReportHoSoByNganh>? reportHoSoByNganh;
  List<ReportTrungTuyenByNganh>? reportTrungTuyenByNganh;
  List<ReportSinhVienByNganh>? reportSinhVienByNganh;

  DashboardModel({
    this.thongTinChung,
    this.reportNguyenVongByNganh,
    this.reportHoSoByNganh,
    this.reportTrungTuyenByNganh,
    this.reportSinhVienByNganh,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      thongTinChung: json['thongTinChung'] != null
          ? ThongTinChung.fromJson(json['thongTinChung'])
          : null,
      reportNguyenVongByNganh: json['reportNguyenVongByNganh'] != null
          ? (json['reportNguyenVongByNganh'] as List)
              .map((v) => ReportNguyenVongByNganh.fromJson(v))
              .toList()
          : null,
      reportHoSoByNganh: json['reportHoSoByNganh'] != null
          ? (json['reportHoSoByNganh'] as List)
              .map((v) => ReportHoSoByNganh.fromJson(v))
              .toList()
          : null,
      reportTrungTuyenByNganh: json['reportTrungTuyenByNganh'] != null
          ? (json['reportTrungTuyenByNganh'] as List)
              .map((v) => ReportTrungTuyenByNganh.fromJson(v))
              .toList()
          : null,
      reportSinhVienByNganh: json['reportSinhVienByNganh'] != null
          ? (json['reportSinhVienByNganh'] as List)
              .map((v) => ReportSinhVienByNganh.fromJson(v))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (thongTinChung != null) 'thongTinChung': thongTinChung!.toJson(),
      if (reportNguyenVongByNganh != null)
        'reportNguyenVongByNganh':
            reportNguyenVongByNganh!.map((v) => v.toJson()).toList(),
      if (reportHoSoByNganh != null)
        'reportHoSoByNganh': reportHoSoByNganh!.map((v) => v.toJson()).toList(),
      if (reportTrungTuyenByNganh != null)
        'reportTrungTuyenByNganh':
            reportTrungTuyenByNganh!.map((v) => v.toJson()).toList(),
      if (reportSinhVienByNganh != null)
        'reportSinhVienByNganh':
            reportSinhVienByNganh!.map((v) => v.toJson()).toList(),
    };
  }
}

class ThongTinChung {
  int? countNguyenVong;
  int? countThiSinh;
  int? countSinhVien;
  int? countTrungTuyen;
  double? sumThuTien;

  ThongTinChung({
    this.countNguyenVong,
    this.countThiSinh,
    this.countSinhVien,
    this.countTrungTuyen,
    this.sumThuTien,
  });

  factory ThongTinChung.fromJson(Map<String, dynamic> json) {
    return ThongTinChung(
      countNguyenVong: json['countNguyenVong'],
      countThiSinh: json['countThiSinh'],
      countSinhVien: json['countSinhVien'],
      countTrungTuyen: json['countTrungTuyen'],
      sumThuTien: json['sumThuTien'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countNguyenVong': countNguyenVong,
      'countThiSinh': countThiSinh,
      'countSinhVien': countSinhVien,
      'countTrungTuyen': countTrungTuyen,
      'sumThuTien': sumThuTien,
    };
  }
}

class ReportNguyenVongByNganh {
  int? soNguyenVong;
  int? nganhId;
  String? maNganh;
  String? tenNganh;

  ReportNguyenVongByNganh({
    this.soNguyenVong,
    this.nganhId,
    this.maNganh,
    this.tenNganh,
  });

  factory ReportNguyenVongByNganh.fromJson(Map<String, dynamic> json) {
    return ReportNguyenVongByNganh(
      soNguyenVong: json['soNguyenVong'],
      nganhId: json['nganhId'],
      maNganh: json['maNganh'],
      tenNganh: json['tenNganh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'soNguyenVong': soNguyenVong,
      'nganhId': nganhId,
      'maNganh': maNganh,
      'tenNganh': tenNganh,
    };
  }
}

class ReportHoSoByNganh {
  int? soHoSo;
  int? nganhId;
  String? maNganh;
  String? tenNganh;

  ReportHoSoByNganh({
    this.soHoSo,
    this.nganhId,
    this.maNganh,
    this.tenNganh,
  });

  factory ReportHoSoByNganh.fromJson(Map<String, dynamic> json) {
    return ReportHoSoByNganh(
      soHoSo: json['soHoSo'],
      nganhId: json['nganhId'],
      maNganh: json['maNganh'],
      tenNganh: json['tenNganh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'soHoSo': soHoSo,
      'nganhId': nganhId,
      'maNganh': maNganh,
      'tenNganh': tenNganh,
    };
  }
}

class ReportTrungTuyenByNganh {
  int? soTrungTruyen;
  int? nganhId;
  String? maNganh;
  String? tenNganh;

  ReportTrungTuyenByNganh({
    this.soTrungTruyen,
    this.nganhId,
    this.maNganh,
    this.tenNganh,
  });

  factory ReportTrungTuyenByNganh.fromJson(Map<String, dynamic> json) {
    return ReportTrungTuyenByNganh(
      soTrungTruyen: json['soTrungTruyen'],
      nganhId: json['nganhId'],
      maNganh: json['maNganh'],
      tenNganh: json['tenNganh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'soTrungTruyen': soTrungTruyen,
      'nganhId': nganhId,
      'maNganh': maNganh,
      'tenNganh': tenNganh,
    };
  }
}

class ReportSinhVienByNganh {
  int? soSinhVien;
  int? nganhId;
  String? maNganh;
  String? tenNganh;

  ReportSinhVienByNganh({
    this.soSinhVien,
    this.nganhId,
    this.maNganh,
    this.tenNganh,
  });

  factory ReportSinhVienByNganh.fromJson(Map<String, dynamic> json) {
    return ReportSinhVienByNganh(
      soSinhVien: json['soSinhVien'],
      nganhId: json['nganhId'],
      maNganh: json['maNganh'],
      tenNganh: json['tenNganh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'soSinhVien': soSinhVien,
      'nganhId': nganhId,
      'maNganh': maNganh,
      'tenNganh': tenNganh,
    };
  }
}
