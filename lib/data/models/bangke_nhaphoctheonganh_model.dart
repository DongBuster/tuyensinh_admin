class BangKeNhapHocNganhModel {
  final String? maNganhTt;
  final String? tenNganhTt;
  final double? tong;

  BangKeNhapHocNganhModel({
    this.maNganhTt,
    this.tenNganhTt,
    this.tong,
  });

  factory BangKeNhapHocNganhModel.fromJson(Map<String, dynamic> json) {
    return BangKeNhapHocNganhModel(
      maNganhTt: json['maNganhTt'] as String?,
      tenNganhTt: json['tenNganhTT'] as String?,
      tong: (json['tong'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maNganhTt': maNganhTt,
      'tenNganhTT': tenNganhTt,
      'tong': tong,
    };
  }
}
