class HeDaoTaoModel {
  int heDaoTaoId;
  String maHeDaoTao;
  String tenHeDaoTao;
  String? status;
  String? ghiChu;

  HeDaoTaoModel({
    required this.heDaoTaoId,
    required this.maHeDaoTao,
    required this.tenHeDaoTao,
    this.status,
    this.ghiChu,
  });

  factory HeDaoTaoModel.fromJson(Map<String, dynamic> json) {
    return HeDaoTaoModel(
      heDaoTaoId: json['heDaoTaoId'],
      maHeDaoTao: json['maHeDaoTao'],
      tenHeDaoTao: json['tenHeDaoTao'],
      status: json['status'],
      ghiChu: json['ghiChu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'heDaoTaoId': heDaoTaoId,
      'maHeDaoTao': maHeDaoTao,
      'tenHeDaoTao': tenHeDaoTao,
      'status': status,
      'ghiChu': ghiChu,
    };
  }

  HeDaoTaoModel copyWith({
    int? heDaoTaoId,
    String? maHeDaoTao,
    String? tenHeDaoTao,
    String? status,
    String? ghiChu,
  }) {
    return HeDaoTaoModel(
      heDaoTaoId: heDaoTaoId ?? this.heDaoTaoId,
      maHeDaoTao: maHeDaoTao ?? this.maHeDaoTao,
      tenHeDaoTao: tenHeDaoTao ?? this.tenHeDaoTao,
      status: status ?? this.status,
      ghiChu: ghiChu ?? this.ghiChu,
    );
  }
}
