class TinhModel {
  int? tinhId;
  String? maTinh;
  String? tenTinh;
  String? status;
  String? ghiChu;
  List<dynamic>? quanHuyen;
  List<dynamic>? truong;

  TinhModel({
    this.tinhId,
    this.maTinh,
    this.tenTinh,
    this.status,
    this.ghiChu,
    this.quanHuyen,
    this.truong,
  });

  factory TinhModel.fromJson(Map<String, dynamic> json) {
    return TinhModel(
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
