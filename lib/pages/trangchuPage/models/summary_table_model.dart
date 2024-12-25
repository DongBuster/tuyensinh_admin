import 'dart:convert';

class SummaryTableModel {
  final String maNganh;
  final String tenNganh;
  final int soNguyenVong;
  final int soHoso;
  final int soTrungTruyen;
  final int soSinhVien;
  SummaryTableModel({
    required this.maNganh,
    required this.tenNganh,
    required this.soNguyenVong,
    required this.soHoso,
    required this.soTrungTruyen,
    required this.soSinhVien,
  });

  SummaryTableModel copyWith({
    String? maNganh,
    String? tenNganh,
    int? soNguyenVong,
    int? soHoso,
    int? soTrungTruyen,
    int? soSinhVien,
  }) {
    return SummaryTableModel(
      maNganh: maNganh ?? this.maNganh,
      tenNganh: tenNganh ?? this.tenNganh,
      soNguyenVong: soNguyenVong ?? this.soNguyenVong,
      soHoso: soHoso ?? this.soHoso,
      soTrungTruyen: soTrungTruyen ?? this.soTrungTruyen,
      soSinhVien: soSinhVien ?? this.soSinhVien,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maNganh': maNganh,
      'tenNganh': tenNganh,
      'soNguyenVong': soNguyenVong,
      'soHoso': soHoso,
      'soTrungTruyen': soTrungTruyen,
      'soSinhVien': soSinhVien,
    };
  }

  factory SummaryTableModel.fromMap(Map<String, dynamic> map) {
    return SummaryTableModel(
      maNganh: map['maNganh'] as String,
      tenNganh: map['tenNganh'] as String,
      soNguyenVong: map['soNguyenVong'] as int,
      soHoso: map['soHoso'] as int,
      soTrungTruyen: map['soTrungTruyen'] as int,
      soSinhVien: map['soSinhVien'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SummaryTableModel.fromJson(String source) =>
      SummaryTableModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SummaryTableModel(maNganh: $maNganh, tenNganh: $tenNganh, soNguyenVong: $soNguyenVong, soHoso: $soHoso, soTrungTruyen: $soTrungTruyen, soSinhVien: $soSinhVien)';
  }

  @override
  bool operator ==(covariant SummaryTableModel other) {
    if (identical(this, other)) return true;

    return other.maNganh == maNganh &&
        other.tenNganh == tenNganh &&
        other.soNguyenVong == soNguyenVong &&
        other.soHoso == soHoso &&
        other.soTrungTruyen == soTrungTruyen &&
        other.soSinhVien == soSinhVien;
  }

  @override
  int get hashCode {
    return maNganh.hashCode ^
        tenNganh.hashCode ^
        soNguyenVong.hashCode ^
        soHoso.hashCode ^
        soTrungTruyen.hashCode ^
        soSinhVien.hashCode;
  }
}
