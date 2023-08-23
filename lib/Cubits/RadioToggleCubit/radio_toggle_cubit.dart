import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radio_toggle_state.dart';

class RadioToggleCubit extends Cubit<RadioToggleState> {
  RadioToggleCubit() : super(RadioToggleInitial());

  int currentValue = 0;

  void toggleRadios(value) {
    currentValue = value;
    emit(RadioToggleInitial());
  }
}
