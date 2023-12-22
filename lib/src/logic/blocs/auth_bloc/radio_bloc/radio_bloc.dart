import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";

part 'radio_event.dart';
part 'radio_state.dart';

enum Auth { signIn, signUp }

class RadioBloc extends Bloc<RadioEvent, RadioState> {
  RadioBloc() : super(const RadioSignUpState(auth: Auth.signUp)) {
    on<RadioChangedEvent>(_onRadioChangeHandler);
  }

  void _onRadioChangeHandler(event, emit) {
    if (event.auth == Auth.signIn) {
      emit(RadioSingInState(auth: event.auth));
    } else {
      emit(RadioSignUpState(auth: event.auth));
    }
  }
}
