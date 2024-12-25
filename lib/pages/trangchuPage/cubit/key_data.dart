import 'package:flutter_bloc/flutter_bloc.dart';

class KeyDataCubit extends Cubit<String> {
  KeyDataCubit() : super('0');
  void setKeyData(String keyData) => emit(keyData);
}
