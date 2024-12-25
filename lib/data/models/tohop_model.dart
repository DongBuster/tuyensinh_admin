class ToHopModel {
  final int? toHopId;
  final String? maToHop;
  final String? tenToHop;
  final List<dynamic>? nganhToHop;
  final List<dynamic>? nguyenVong;
  final List<dynamic>? toHopMonHoc;

  ToHopModel({
    this.toHopId,
    this.maToHop,
    this.tenToHop,
    this.nganhToHop,
    this.nguyenVong,
    this.toHopMonHoc,
  });

  factory ToHopModel.fromJson(Map<String, dynamic> json) {
    return ToHopModel(
      toHopId: json['toHopId'] as int?,
      maToHop: json['maToHop'] as String?,
      tenToHop: json['tenToHop'] as String?,
      nganhToHop: json['nganhToHop'] as List<dynamic>?,
      nguyenVong: json['nguyenVong'] as List<dynamic>?,
      toHopMonHoc: json['toHopMonHoc'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'toHopId': toHopId,
      'maToHop': maToHop,
      'tenToHop': tenToHop,
      'nganhToHop': nganhToHop,
      'nguyenVong': nguyenVong,
      'toHopMonHoc': toHopMonHoc,
    };
  }
}
