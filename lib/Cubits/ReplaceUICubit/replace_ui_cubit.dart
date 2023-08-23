import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'replace_ui_state.dart';

class ReplaceUiCubit extends Cubit<ReplaceUiState> {
  ReplaceUiCubit() : super(ReplaceUiInitial());

  void showText() {
    emit(ShowText());
  }

  void showCubitImage() {
    emit(ShowCubitImage());
  }

  void showRedCircle() {
    emit(ShowRedCircle());
  }

  void reset() {
    emit(ReplaceUiInitial());
  }
}
