class KinhPhiNhapHocModel {
  final int id;
  final int khoaId;
  final String maKhoa;
  final int nganhId;
  final String maNganh;
  final String tenKhoa;
  final String tenNganh;
  final double tienHocPhi;
  final double tienKhamSk;
  final double tienBhyt;
  final double tienTheSv;
  final double tienThueGdqp;
  final double tienLePhiNh;
  final double tienKiemTraHs;
  final double tongTien;
  final int heDaoTaoId;

  KinhPhiNhapHocModel({
    required this.id,
    required this.khoaId,
    required this.maKhoa,
    required this.nganhId,
    required this.maNganh,
    required this.tenKhoa,
    required this.tenNganh,
    required this.tienHocPhi,
    required this.tienKhamSk,
    required this.tienBhyt,
    required this.tienTheSv,
    required this.tienThueGdqp,
    required this.tienLePhiNh,
    required this.tienKiemTraHs,
    required this.tongTien,
    required this.heDaoTaoId,
  });

  // Factory method to create an instance from JSON
  factory KinhPhiNhapHocModel.fromJson(Map<String, dynamic> json) {
    return KinhPhiNhapHocModel(
      id: json['id'],
      khoaId: json['khoaId'],
      maKhoa: json['maKhoa'],
      nganhId: json['nganhId'],
      maNganh: json['maNganh'],
      tenKhoa: json['tenKhoa'],
      tenNganh: json['tenNganh'],
      tienHocPhi: json['tienHocPhi'] as double,
      tienKhamSk: json['tienKhamSk'] as double,
      tienBhyt: json['tienBhyt'] as double,
      tienTheSv: json['tienTheSv'] as double,
      tienThueGdqp: json['tienThueGdqp'] as double,
      tienLePhiNh: json['tienLePhiNh'] as double,
      tienKiemTraHs: json['tienKiemTraHs'] as double,
      tongTien: json['tongTien'] as double,
      heDaoTaoId: json['heDaoTaoId'],
    );
  }

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'khoaId': khoaId,
      'maKhoa': maKhoa,
      'nganhId': nganhId,
      'maNganh': maNganh,
      'tenKhoa': tenKhoa,
      'tenNganh': tenNganh,
      'tienHocPhi': tienHocPhi,
      'tienKhamSk': tienKhamSk,
      'tienBhyt': tienBhyt,
      'tienTheSv': tienTheSv,
      'tienThueGdqp': tienThueGdqp,
      'tienLePhiNh': tienLePhiNh,
      'tienKiemTraHs': tienKiemTraHs,
      'tongTien': tongTien,
      'heDaoTaoId': heDaoTaoId,
    };
  }
}
