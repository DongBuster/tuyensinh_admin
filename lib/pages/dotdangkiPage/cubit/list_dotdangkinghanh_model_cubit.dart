import 'package:dkxt_admin/data/models/dotdangkinganh_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListDotdangkinghanhModelCubit extends Cubit<List<DotdangkinganhModel>> {
  ListDotdangkinghanhModelCubit() : super([]);
  void delete() {
    emit([]);
  }

  void update(int dotDangKyId, DotdangkinganhModel updatedModel) {
    final updatedList = state.map((model) {
      return model.dotDangKyId == dotDangKyId ? updatedModel : model;
    }).toList();

    emit(updatedList);
  }

  void initial(List<DotdangkinganhModel> list) {
    final initialList = [...list];
    emit(initialList);
  }
}
