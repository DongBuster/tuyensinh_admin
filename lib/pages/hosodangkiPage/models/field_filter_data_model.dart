class FieldFilterDataModel {
  late String dotdangkiId;
  late String createdTime;
  late String endTime;
  late String maNganh;
  late String status;
  late String maHoSo;
  late String hoTen;
  late String nguyenVong;
  late String nguoiTao;
  FieldFilterDataModel({
    required this.dotdangkiId,
    required this.createdTime,
    required this.endTime,
    required this.maNganh,
    required this.status,
    required this.maHoSo,
    required this.hoTen,
    required this.nguyenVong,
    required this.nguoiTao,
  });
  FieldFilterDataModel.init() {
    dotdangkiId = '0';
    createdTime = '';
    endTime = '';
    maNganh = '';
    status = '';
    maHoSo = '';
    hoTen = '';
    nguyenVong = '1';
    nguoiTao = '';
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
        other.nguyenVong == nguyenVong &&
        other.nguoiTao == nguoiTao;
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
        nguyenVong.hashCode ^
        nguoiTao.hashCode;
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
      nguyenVong: nguyenVong ?? this.nguyenVong,
      nguoiTao: nguoiTao ?? this.nguoiTao,
    );
  }
}
