class DoiTuongUuTienModel {
  int doiTuongId;
  String maDoiTuong;
  String tenDoiTuong;
  double diemUuTien;
  String? status;
  String? ghiChu;

  DoiTuongUuTienModel({
    required this.doiTuongId,
    required this.maDoiTuong,
    required this.tenDoiTuong,
    required this.diemUuTien,
    this.status,
    this.ghiChu,
  });

  factory DoiTuongUuTienModel.fromJson(Map<String, dynamic> json) {
    return DoiTuongUuTienModel(
      doiTuongId: json['doiTuongId'],
      maDoiTuong: json['maDoiTuong'],
      tenDoiTuong: json['tenDoiTuong'],
      diemUuTien: json['diemUuTien'].toDouble(),
      status: json['status'],
      ghiChu: json['ghiChu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doiTuongId': doiTuongId,
      'maDoiTuong': maDoiTuong,
      'tenDoiTuong': tenDoiTuong,
      'diemUuTien': diemUuTien,
      'status': status,
      'ghiChu': ghiChu,
    };
  }

  DoiTuongUuTienModel copyWith({
    int? doiTuongId,
    String? maDoiTuong,
    String? tenDoiTuong,
    double? diemUuTien,
    String? status,
    String? ghiChu,
  }) {
    return DoiTuongUuTienModel(
      doiTuongId: doiTuongId ?? this.doiTuongId,
      maDoiTuong: maDoiTuong ?? this.maDoiTuong,
      tenDoiTuong: tenDoiTuong ?? this.tenDoiTuong,
      diemUuTien: diemUuTien ?? this.diemUuTien,
      status: status ?? this.status,
      ghiChu: ghiChu ?? this.ghiChu,
    );
  }
}
