import 'package:flutter_bloc/flutter_bloc.dart';

class ListHosoDuyetCubit extends Cubit<List<int>> {
  ListHosoDuyetCubit() : super([]);
  void addMaHoso(int maHoSo) {
    state.add(maHoSo);
    emit(state);
  }

  void removeMaHoso(int maHoSo) {
    state.removeWhere((element) => element == maHoSo);
    emit(state);
  }

  void deleteAllMaHoso() {
    emit([]);
  }
}
