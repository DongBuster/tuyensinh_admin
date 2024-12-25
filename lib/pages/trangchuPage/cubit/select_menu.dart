import 'package:flutter_bloc/flutter_bloc.dart';

class NameSelectMenuCubit extends Cubit<String> {
  NameSelectMenuCubit() : super('Tất cả các đợt đăng kí');
  void setKeyData(String nameMenu) => emit(nameMenu);
}
