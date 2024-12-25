class GlobalVariable {
  static const List<String> listTenLoaiDot = [
    'Học bạ',
    'Trung học phổ thông',
    'Thi',
    'Tuyển thẳng',
    'THPT và chứng chỉ Tiếng anh quốc tế',
  ];
  static const List<String> listStatusDotDangkiPage = [
    'Đăng kí',
    'Đang xem',
    'Kết thúc',
  ];
  static const List<String> listNguyenVongHosodangkiPage = [
    'Tất cả nguyện vọng',
    'Nguyện vọng thứ 1',
    'Nguyện vọng thứ 2',
    'Nguyện vọng thứ 3',
    'Nguyện vọng thứ 4',
    'Nguyện vọng thứ 5',
    'Nguyện vọng thứ 6',
    'Nguyện vọng thứ 7',
    'Nguyện vọng thứ 8',
    'Nguyện vọng thứ 9',
    'Nguyện vọng thứ 10',
    'Nguyện vọng thứ 11',
    'Nguyện vọng thứ 12',
    'Nguyện vọng thứ 13',
    'Nguyện vọng thứ 14',
    'Nguyện vọng thứ 15',
    'Nguyện vọng thứ 16',
    'Nguyện vọng thứ 17',
    'Nguyện vọng thứ 18',
    'Nguyện vọng thứ 19',
    'Nguyện vọng thứ 20',
    'Nguyện vọng thứ 21',
    'Nguyện vọng thứ 22',
    'Nguyện vọng thứ 23',
    'Nguyện vọng thứ 24',
    'Nguyện vọng thứ 25',
    'Nguyện vọng thứ 26',
    'Nguyện vọng thứ 27',
    'Nguyện vọng thứ 28',
    'Nguyện vọng thứ 29',
    'Nguyện vọng thứ 30'
  ];

  static const List<String> listStatusHosodangkiPage = [
    'Tất cả trạng thái',
    'NEW',
    'CHECKED',
    'ERROR',
  ];
  static const Map<String, dynamic> mapStatusHosoTrungtuyenPage = {
    'Tất cả trạng thái': '',
    'Trúng tuyển': 'TRUNGTUYEN',
    'Gửi mail trúng tuyển': 'MAIL_TRUNGTUYEN',
    'Xác nhận': 'XACNHAN',
    'Đóng tiền': 'DONGTIEN',
    'Nhập học': 'NHAPHOC',
    'Nộp hồ sơ': 'NOPHOSO',
    'Xong': 'OK',
  };
  static const Map<String, dynamic> fromJsonStatusHosoTrungtuyenPage = {
    'TRUNGTUYEN': 'Trúng tuyển',
    'MAIL_TRUNGTUYEN': 'Gửi mail trúng tuyển',
    'XACNHAN': 'Xác nhận',
    'DONGTIEN': 'Đóng tiền',
    'NHAPHOC': 'Nhập học',
    'NOPHOSO': 'Nộp hồ sơ',
    'OK': 'Xong',
  };
  static const Map<String, dynamic> fromJsonStatusTrungtuyenPage = {
    'XETTUYEN': 'Đã xét tuyển',
    'DALUACHON': 'Đã chốt',
  };

  static const List<String> listStatusTrungtuyenPage = [
    'Tất cả trạng thái',
    'Trúng tuyển',
    'Gửi mail trúng tuyển',
    'Xác nhận',
    'Đóng tiền',
    'Nhập học',
    'Nộp hồ sơ',
    'Xong',
  ];

  static const List<String> listTypeHosoNhapHocPage = [
    'Tất cả',
    'Online',
    'Trực tiếp',
  ];
  static const Map<String, dynamic> toJsonTypeHosoNhapHocPage = {
    'Tất cả': '',
    'Online': 'ONLINE',
    'Trực tiếp': 'TRUCTIEP',
  };
  static const List<String> listStatusHosoNhapHocPage = [
    'Tất cả',
    'Nhập học',
    'Đóng tiền',
    'Xong',
    'Nộp hồ sơ',
  ];
  static const Map<String, dynamic> toJsonStatusHosoNhapHocPage = {
    'Tất cả': '',
    'Nhập học': 'NHAPHOC',
    'Đóng tiền': 'DONGTIEN',
    'Xong': 'OK',
    'Nộp hồ sơ': 'NOPHOSO',
  };
}
