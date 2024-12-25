class DotdangkinganhModel {
  final int dotDangKyId;
  final String tenDot;
  final int nganhId;
  final String maNganh;
  final String tenNganh;
  int? chiTieu;
  int? maxChiTieu;
  double? diemNhanHoSo;
  bool duocChon;

  DotdangkinganhModel({
    required this.dotDangKyId,
    required this.tenDot,
    required this.nganhId,
    required this.maNganh,
    required this.tenNganh,
    required this.chiTieu,
    required this.maxChiTieu,
    required this.diemNhanHoSo,
    required this.duocChon,
  });

  DotdangkinganhModel.init({
    this.dotDangKyId = 0,
    this.tenDot = '',
    this.nganhId = 0,
    this.maNganh = '',
    this.tenNganh = '',
    this.chiTieu,
    this.maxChiTieu,
    this.diemNhanHoSo,
    this.duocChon = false,
  });

  factory DotdangkinganhModel.fromJson(Map<String, dynamic> json) {
    return DotdangkinganhModel(
      dotDangKyId: json['dotDangKyId'],
      tenDot: json['tenDot'],
      nganhId: json['nganhId'],
      maNganh: json['maNganh'],
      tenNganh: json['tenNganh'],
      chiTieu: json['chiTieu'],
      maxChiTieu: json['maxChiTieu'],
      diemNhanHoSo: json['diemNhanHoSo']?.toDouble(),
      duocChon: json['duocChon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dotDangKyId': dotDangKyId,
      'tenDot': tenDot,
      'nganhId': nganhId,
      'maNganh': maNganh,
      'tenNganh': tenNganh,
      'chiTieu': chiTieu,
      'maxChiTieu': maxChiTieu,
      'diemNhanHoSo': diemNhanHoSo,
      'duocChon': duocChon,
    };
  }
}
