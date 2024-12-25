class ViewNghanhpageModel {
  int nganhId;
  String maNganh;
  String tenNganh;
  int chiTieuHb;
  int chiTieuThpt;
  String choPhepDk;
  String tenKhoa;
  int soTohop;
  List<String> tohop;
  ViewNghanhpageModel({
    required this.nganhId,
    required this.maNganh,
    required this.tenNganh,
    required this.chiTieuHb,
    required this.chiTieuThpt,
    required this.choPhepDk,
    required this.tenKhoa,
    required this.soTohop,
    required this.tohop,
  });
}
