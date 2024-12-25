class KhoaModel {
  int? khoaId;
  String? maKhoa;
  String? tenKhoa;
  String? dienThoai;
  String? email;
  String? diaChi;
  String? status;
  String? ghiChu;
  List<dynamic>? nganh;

  KhoaModel({
    this.khoaId,
    this.maKhoa,
    this.tenKhoa,
    this.dienThoai,
    this.email,
    this.diaChi,
    this.status,
    this.ghiChu,
    this.nganh,
  });

  factory KhoaModel.fromJson(Map<String, dynamic> json) {
    return KhoaModel(
      khoaId: json['khoaId'] as int?,
      maKhoa: json['maKhoa'] as String?,
      tenKhoa: json['tenKhoa'] as String?,
      dienThoai: json['dienThoai'] as String?,
      email: json['email'] as String?,
      diaChi: json['diaChi'] as String?,
      status: json['status'] as String?,
      ghiChu: json['ghiChu'] as String?,
      nganh: json['nganh']
          as List<dynamic>?, // Thay `dynamic` nếu có cấu trúc cụ thể
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'khoaId': khoaId,
      'maKhoa': maKhoa,
      'tenKhoa': tenKhoa,
      'dienThoai': dienThoai,
      'email': email,
      'diaChi': diaChi,
      'status': status,
      'ghiChu': ghiChu,
      'nganh': nganh,
    };
  }

  KhoaModel copyWith({
    int? khoaId,
    String? maKhoa,
    String? tenKhoa,
    String? dienThoai,
    String? email,
    String? diaChi,
    String? status,
    String? ghiChu,
    List<dynamic>? nganh,
  }) {
    return KhoaModel(
      khoaId: khoaId ?? this.khoaId,
      maKhoa: maKhoa ?? this.maKhoa,
      tenKhoa: tenKhoa ?? this.tenKhoa,
      dienThoai: dienThoai ?? this.dienThoai,
      email: email ?? this.email,
      diaChi: diaChi ?? this.diaChi,
      status: status ?? this.status,
      ghiChu: ghiChu ?? this.ghiChu,
      nganh: nganh ?? this.nganh,
    );
  }
}
