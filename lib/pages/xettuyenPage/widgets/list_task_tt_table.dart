import 'package:dkxt_admin/pages/xettuyenPage/logicUI/xettuyen_logic_ui.dart';
import 'package:flutter/material.dart';
import '../../../constant/global/global_widgets.dart';
import '../../../data/models/xettuyen_page_model.dart';

class ListTaskTrungTuyenTable extends StatefulWidget {
  final PhuongAnXetTuyens thiSinhModel;
  const ListTaskTrungTuyenTable({super.key, required this.thiSinhModel});

  @override
  State<ListTaskTrungTuyenTable> createState() =>
      _ListTaskTrungTuyenTableState();
}

class _ListTaskTrungTuyenTableState extends State<ListTaskTrungTuyenTable> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          splashColor: Colors.grey.shade300,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                List<String> listName = [
                  'Không cộng điểm ưu tiên',
                  'Có cộng điểm ưu tiên'
                ];
                String valueSelected = listName.first;
                return Dialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Duyệt phương án xét tuyển',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SelectTextInput(
                          title: 'Cộng điểm ưu tiên',
                          listData: listName,
                          initValue: listName.first,
                          onSelected: (value) {
                            valueSelected = value!;
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                bool isCongDiem =
                                    valueSelected == listName.first
                                        ? false
                                        : true;
                                XettuyenLogicUi.duyetPhuongAnXT(
                                    '${widget.thiSinhModel.dotDangKyId!}',
                                    widget.thiSinhModel.maPhuongAn!,
                                    isCongDiem);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Send',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(
            Icons.grading_rounded,
            size: 20,
            color: Colors.blue.shade300,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          splashColor: Colors.grey.shade300,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        const Icon(
                          Icons.error_outline_outlined,
                          size: 70,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Xóa Phương án',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Bạn có chắc chắn muốn ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          'xóa không?',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.blue),
                              ),
                              onPressed: () {
                                XettuyenLogicUi.xoaPhuongAnXT(
                                    '${widget.thiSinhModel.dotDangKyId!}',
                                    widget.thiSinhModel.maPhuongAn!);

                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Đồng ý',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Thoát',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.delete_forever,
            size: 20,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
