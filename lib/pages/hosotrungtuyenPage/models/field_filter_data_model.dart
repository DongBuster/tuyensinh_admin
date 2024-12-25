class FieldFilterDataModel {
  late String dotdangkiId;
  late String maNganh;
  late String status;
  late String maHoSo;
  late String hoTen;
  FieldFilterDataModel({
    required this.dotdangkiId,
    required this.maNganh,
    required this.status,
    required this.maHoSo,
    required this.hoTen,
  });
  FieldFilterDataModel.init() {
    dotdangkiId = '0';
    maNganh = '';
    status = '';
    maHoSo = '';
    hoTen = '';
  }

  @override
  bool operator ==(covariant FieldFilterDataModel other) {
    if (identical(this, other)) return true;

    return other.dotdangkiId == dotdangkiId &&
        other.maNganh == maNganh &&
        other.status == status &&
        other.maHoSo == maHoSo &&
        other.hoTen == hoTen;
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
      maNganh: maNganh ?? this.maNganh,
      status: status ?? this.status,
      maHoSo: maHoSo ?? this.maHoSo,
      hoTen: hoTen ?? this.hoTen,
    );
  }

  @override
  int get hashCode {
    return dotdangkiId.hashCode ^
        maNganh.hashCode ^
        status.hashCode ^
        maHoSo.hashCode ^
        hoTen.hashCode;
  }
}
