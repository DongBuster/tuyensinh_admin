import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dkxt_admin/constant/global/global_function.dart';
import 'package:dkxt_admin/data/models/dotdangkinganh_model.dart';
import 'package:dkxt_admin/pages/dotdangkiPage/cubit/list_dotdangkinghanh_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../data/repositories/dotdangki_page_repo.dart';
import '../widgets/list_dotdangkinghanh_table.dart';

class SelectNganhdangkiScreen extends StatefulWidget {
  final String title;
  final String dotDangKyId;
  const SelectNganhdangkiScreen(
      {super.key, required this.dotDangKyId, required this.title});

  @override
  State<SelectNganhdangkiScreen> createState() =>
      _SelectNganhdangkiScreenState();
}

class _SelectNganhdangkiScreenState extends State<SelectNganhdangkiScreen> {
  late Future<dynamic> _future;
  Timer? _timer;
  bool _isLoadingExceeded = false;
  DotdangkiPageRepo dotdangkiPageRepo = DotdangkiPageRepo();

  @override
  void initState() {
    _future = dotdangkiPageRepo.fetchListDotdangkiNganh(widget.dotDangKyId);
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.read<ListDotdangkinghanhModelCubit>().delete();
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Đợt ${widget.title}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  padding:
                      WidgetStatePropertyAll(EdgeInsets.fromLTRB(3, 0, 3, 0)),
                ),
                onPressed: () async {
                  List<DotdangkinganhModel> list =
                      context.read<ListDotdangkinghanhModelCubit>().state;

                  Response response = await dotdangkiPageRepo
                      .updateDotdangkiNghanh(list, list.first.dotDangKyId);
                  GlobalFunction.checkResponse(response);
                  if (context.mounted) {
                    context.pop();
                  }
                },
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              // print(snapshot);
              if (snapshot.connectionState == ConnectionState.waiting) {
                _timer ??= Timer(const Duration(seconds: 10), () {
                  Fluttertoast.showToast(
                    msg:
                        "Time exceed, Please check your Internet or Refesh page",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                  );
                  setState(() {
                    _isLoadingExceeded = true;
                    _timer!.cancel();
                  });
                  return;
                });

                if (!_isLoadingExceeded) {
                  // Hiển thị loading trong 10 giây đầu
                  return Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                      color: Colors.blue,
                      size: 50,
                    ),
                  );
                }
              }
              if (snapshot.hasData && snapshot.data != null) {
                _timer?.cancel();
                _timer = null;
                context
                    .watch<ListDotdangkinghanhModelCubit>()
                    .initial(snapshot.data);
                return ListDotdangkiNghanhTable(
                    listDotDangkiNganh: snapshot.data);
              }
              if (snapshot.hasError || _isLoadingExceeded) {
                // Hiển thị giao diện khi vượt quá thời gian tải hoặc gặp lỗi
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Failed to load data. Please refresh.",
                        style: TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isLoadingExceeded = false;
                            _timer = null;
                          });
                        },
                        child: const Text("Refresh"),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
