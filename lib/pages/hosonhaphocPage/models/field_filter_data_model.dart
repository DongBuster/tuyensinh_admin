class FieldFilterDataModel {
  late String dotdangkiId;
  late String createdTime;
  late String endTime;
  late String maNganh;
  late String status;
  late String maHoSo;
  late String hoTen;
  late String type;
  FieldFilterDataModel({
    required this.dotdangkiId,
    required this.createdTime,
    required this.endTime,
    required this.maNganh,
    required this.status,
    required this.maHoSo,
    required this.hoTen,
    required this.type,
  });
  FieldFilterDataModel.init() {
    dotdangkiId = '0';
    createdTime = '';
    endTime = '';
    maNganh = '';
    status = '';
    maHoSo = '';
    hoTen = '';
    type = '';
  }

  @override
  bool operator ==(covariant FieldFilterDataModel other) {
    if (identical(this, other)) return true;

    return other.dotdangkiId == dotdangkiId &&
        other.createdTime == createdTime &&
        other.endTime == endTime &&
        other.maNganh == maNganh &&
        other.status == status &&
        other.maHoSo == maHoSo &&
        other.hoTen == hoTen &&
        other.type == type;
  }

  @override
  int get hashCode {
    return dotdangkiId.hashCode ^
        createdTime.hashCode ^
        endTime.hashCode ^
        maNganh.hashCode ^
        status.hashCode ^
        maHoSo.hashCode ^
        hoTen.hashCode ^
        type.hashCode;
  }

  FieldFilterDataModel copyWith({
    String? dotdangkiId,
    String? createdTime,
    String? endTime,
    String? maNganh,
    String? status,
    String? maHoSo,
    String? hoTen,
    String? nguyenVong,
    String? nguoiTao,
  }) {
    return FieldFilterDataModel(
        dotdangkiId: dotdangkiId ?? this.dotdangkiId,
        createdTime: createdTime ?? this.createdTime,
        endTime: endTime ?? this.endTime,
        maNganh: maNganh ?? this.maNganh,
        status: status ?? this.status,
        maHoSo: maHoSo ?? this.maHoSo,
        hoTen: hoTen ?? this.hoTen,
        type: type);
  }
}
