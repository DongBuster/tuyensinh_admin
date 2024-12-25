class QuanHuyenModel {
  int? quanHuyenId;
  String? maQuanHuyen;
  String? tenQuanHuyen;
  String? status;
  String? ghiChu;
  int? tinhId;
  Tinh? tinh;
  List<dynamic>? thiSinh;

  QuanHuyenModel({
    this.quanHuyenId,
    this.maQuanHuyen,
    this.tenQuanHuyen,
    this.status,
    this.ghiChu,
    this.tinhId,
    this.tinh,
    this.thiSinh,
  });

  factory QuanHuyenModel.fromJson(Map<String, dynamic> json) {
    return QuanHuyenModel(
      quanHuyenId: json['quanHuyenId'],
      maQuanHuyen: json['maQuanHuyen'],
      tenQuanHuyen: json['tenQuanHuyen'],
      status: json['status'],
      ghiChu: json['ghiChu'],
      tinhId: json['tinhId'],
      tinh: json['tinh'] != null ? Tinh.fromJson(json['tinh']) : null,
      thiSinh: json['thiSinh'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quanHuyenId': quanHuyenId,
      'maQuanHuyen': maQuanHuyen,
      'tenQuanHuyen': tenQuanHuyen,
      'status': status,
      'ghiChu': ghiChu,
      'tinhId': tinhId,
      'tinh': tinh?.toJson(),
      'thiSinh': thiSinh,
    };
  }
}

class Tinh {
  int? tinhId;
  String? maTinh;
  String? tenTinh;
  String? status;
  String? ghiChu;
  List<dynamic>? quanHuyen;
  List<dynamic>? truong;

  Tinh({
    this.tinhId,
    this.maTinh,
    this.tenTinh,
    this.status,
    this.ghiChu,
    this.quanHuyen,
    this.truong,
  });

  factory Tinh.fromJson(Map<String, dynamic> json) {
    return Tinh(
      tinhId: json['tinhId'],
      maTinh: json['maTinh'],
      tenTinh: json['tenTinh'],
      status: json['status'],
      ghiChu: json['ghiChu'],
      quanHuyen: json['quanHuyen'] ?? [],
      truong: json['truong'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tinhId': tinhId,
      'maTinh': maTinh,
      'tenTinh': tenTinh,
      'status': status,
      'ghiChu': ghiChu,
      'quanHuyen': quanHuyen,
      'truong': truong,
    };
  }
}
