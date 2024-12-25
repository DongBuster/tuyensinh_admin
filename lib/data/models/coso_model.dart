class CoSoModel {
  int? coSoId;
  String? maCoSo;
  String? tenCoSo;
  String? dienThoai;
  String? email;
  String? diaChi;
  String? status;
  String? ghiChu;
  List<dynamic>? coSoNganh;

  CoSoModel({
    this.coSoId,
    this.maCoSo,
    this.tenCoSo,
    this.dienThoai,
    this.email,
    this.diaChi,
    this.status,
    this.ghiChu,
    this.coSoNganh,
  });

  factory CoSoModel.fromJson(Map<String, dynamic> json) {
    return CoSoModel(
      coSoId: json['coSoId'] as int?,
      maCoSo: json['maCoSo'] as String?,
      tenCoSo: json['tenCoSo'] as String?,
      dienThoai: json['dienThoai'] as String?,
      email: json['email'] as String?,
      diaChi: json['diaChi'] as String?,
      status: json['status'] as String?,
      ghiChu: json['ghiChu'] as String?,
      coSoNganh: json['coSoNganh']
          as List<dynamic>?, // Hoặc thay `dynamic` bằng kiểu phù hợp nếu có
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coSoId': coSoId,
      'maCoSo': maCoSo,
      'tenCoSo': tenCoSo,
      'dienThoai': dienThoai,
      'email': email,
      'diaChi': diaChi,
      'status': status,
      'ghiChu': ghiChu,
      'coSoNganh': coSoNganh,
    };
  }

  CoSoModel copyWith({
    int? coSoId,
    String? maCoSo,
    String? tenCoSo,
    String? dienThoai,
    String? email,
    String? diaChi,
    String? status,
    String? ghiChu,
    List<dynamic>? coSoNganh,
  }) {
    return CoSoModel(
      coSoId: coSoId ?? this.coSoId,
      maCoSo: maCoSo ?? this.maCoSo,
      tenCoSo: tenCoSo ?? this.tenCoSo,
      dienThoai: dienThoai ?? this.dienThoai,
      email: email ?? this.email,
      diaChi: diaChi ?? this.diaChi,
      status: status ?? this.status,
      ghiChu: ghiChu ?? this.ghiChu,
      coSoNganh: coSoNganh ?? this.coSoNganh,
    );
  }
}
