import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_hide_password_state.dart';

class ShowHidePasswordCubit extends Cubit<ShowHidePasswordState> {
  ShowHidePasswordCubit() : super(ShowHidePasswordInitial());

  bool isShown = false;

  void showHidePass() {
    // if (isShown == true) {
    //   isShown = false;
    // } else {
    //   isShown = true;
    // }

    isShown = !isShown;

    emit(ShowHidePasswordInitial());
    // isShown = !isShown;
  }
}
