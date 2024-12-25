import 'package:dkxt_admin/data/models/dotdangki_model.dart';
import 'package:dkxt_admin/pages/trangchuPage/cubit/select_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/key_data.dart';

class SelectMenus extends StatefulWidget {
  List<DotDangKiModel> listDotDangki;
  SelectMenus({super.key, required this.listDotDangki});

  @override
  State<SelectMenus> createState() => _SelectMenusState();
}

class _SelectMenusState extends State<SelectMenus> {
  String dropdownValue = '';
  String defaultInitSelection = 'Tất cả các đợt đăng kí';
  List<String> listTenDot = [];
  bool isExit = false;

  @override
  Widget build(BuildContext context) {
    String nameMenuSelected = context.watch<NameSelectMenuCubit>().state;
    dropdownValue = nameMenuSelected;
    var listData = widget.listDotDangki.map((e) => e.tenDot ?? '').toList();
    listTenDot = [defaultInitSelection, ...listData];

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 12),
      child: DropdownMenu<String>(
        width: MediaQuery.of(context).size.width * 0.68,
        menuHeight: MediaQuery.of(context).size.height * 0.6,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints.tight(const Size.fromHeight(40)),
        ),
        label: const Text('Danh sách đợt đăng kí'),
        initialSelection: nameMenuSelected,
        onSelected: (String? value) {
          if (value == defaultInitSelection) {
            context.read<KeyDataCubit>().setKeyData('0');
            context
                .read<NameSelectMenuCubit>()
                .setKeyData(defaultInitSelection);
          } else {
            DotDangKiModel itemSelected = widget.listDotDangki
                .firstWhere((element) => element.tenDot == value);
            context
                .read<KeyDataCubit>()
                .setKeyData('${itemSelected.dotDangKyId}');
            context.read<NameSelectMenuCubit>().setKeyData('$value');
          }
        },
        dropdownMenuEntries:
            listTenDot.map<DropdownMenuEntry<String>>((String value) {
          bool isSelected = value == dropdownValue;

          return DropdownMenuEntry<String>(
              value: value,
              label: value,
              style: ButtonStyle(
                textStyle: const WidgetStatePropertyAll(
                    TextStyle(fontWeight: FontWeight.normal)),
                foregroundColor: WidgetStatePropertyAll(
                    isSelected ? Colors.blue.shade300 : Colors.black),
              ));
        }).toList(),
      ),
    );
  }
}
