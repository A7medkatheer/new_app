import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  logIn() async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 3)).then((value) {
      emit(LogingSuccess());
    });
  }

  register() async {
    emit(registerLoading());

    await Future.delayed(const Duration(seconds: 3)).then((value) {
      emit(registerSuccess());
    });
  }
}
