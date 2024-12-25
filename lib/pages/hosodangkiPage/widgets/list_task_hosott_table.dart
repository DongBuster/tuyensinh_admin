import 'package:dkxt_admin/pages/hosodangkiPage/logicUI/hosodangki_logic_ui.dart';
import 'package:flutter/material.dart';

import '../../../constant/global/global_widgets.dart';
import '../../../data/models/thongtinthisinh_model.dart';

class ListTaskHosoTTTable extends StatefulWidget {
  final ThiSinh thiSinhModel;
  const ListTaskHosoTTTable({super.key, required this.thiSinhModel});

  @override
  State<ListTaskHosoTTTable> createState() => _ListTaskHosoTTTableState();
}

class _ListTaskHosoTTTableState extends State<ListTaskHosoTTTable> {
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
                String initReceiveEmail = 'phamdung150603@gmail.com';
                bool isCreateFile = false;
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
                          'Thông tin email nhận file',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormFieldEmail(
                          title: 'Email nhận',
                          initValue: initReceiveEmail,
                          onChanged: (value) {
                            initReceiveEmail = value;
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SwitchButton(
                              onSwitchButton: (value) {
                                isCreateFile = value;
                              },
                            ),
                            const Text(
                              'Tạo lại file đăng kí',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
                                HosodangkiLogicUi.sendEmail(
                                  '${widget.thiSinhModel.regCode}',
                                  initReceiveEmail,
                                  isCreateFile,
                                );
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
            Icons.forward_to_inbox_outlined,
            size: 20,
            color: Colors.blue.shade300,
          ),
        ),
        const SizedBox(width: 7),
        InkWell(
          splashColor: Colors.grey.shade300,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                String cost = '${widget.thiSinhModel.lePhi}';
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
                          'Nhập tiền nộp',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFieldInput(
                          title: 'Số tiền',
                          initValue: cost,
                          onChanged: (value) {
                            cost = value;
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
                                HosodangkiLogicUi.changeSoTienDaNop(
                                  '${widget.thiSinhModel.maHoSo}',
                                  cost,
                                  widget.thiSinhModel.status!,
                                );
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
            Icons.attach_money,
            size: 20,
            color: Colors.blue.shade300,
          ),
        ),
        const SizedBox(width: 5),
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
                        Text(
                          'Xóa hồ sơ ${widget.thiSinhModel.maHoSo}',
                          style: const TextStyle(
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
                              onPressed: () async {
                                await HosodangkiLogicUi.xoaHoso(
                                    '${widget.thiSinhModel.maHoSo}');
                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
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
          child: Icon(
            Icons.delete_forever,
            size: 20,
            color: Colors.blue.shade300,
          ),
        ),
      ],
    );
  }
}
