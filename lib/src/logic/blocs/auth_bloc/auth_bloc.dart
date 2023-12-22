import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:flutterzon/src/data/models/user.dart";
import "package:flutterzon/src/data/repositories/auth_repository.dart";
import "package:meta/meta.dart";
import "package:shared_preferences/shared_preferences.dart";

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<TextFieldChangeEvent>(_onTextFieldChangedHander);
    on<CreatedAccountPresentEvent>(_onCreatedAccountPresentHandler);
    on<SignInPresentEvent>(_signInPresentHandler);
  }

  void _onTextFieldChangedHander(
    TextFieldChangeEvent event,
    Emitter<AuthState> emit,
  ) {
    if (event.nameValue == "") {
      emit(TextFieldErrorState(errorString: 'First and last name is required'));
    } else if (event.emailValue == '') {
      emit(TextFieldErrorState(
          errorString: 'Please enter a valid email address'));
    } else if (event.passwordValue.length < 6) {
      emit(TextFieldErrorState(
          errorString: 'Password must be at least 6 characters'));
    } else {
      emit(TextFieldValidState(
          emailValue: event.emailValue, passwordValue: event.passwordValue));
    }
  }

  void _onCreatedAccountPresentHandler(event, emit) async {
    emit(AuthLoadingState());
    User user = User(
      id: '',
      name: event.nameValue,
      email: event.emailValue,
      password: event.passwordValue,
      address: '',
      type: '',
      token: '',
      cart: const [],
      saveForLater: const [],
      keepShoppingFor: const [],
      wishList: const [],
    );

    try {
      User resUser = await authRepository.signUpUser(user);
      emit(CreateUserInProgressState(user: resUser));
      emit(CreateUserSuccessState(
          userCreateString: 'User Created, you can sign in now !'));
    } catch (e) {
      emit(AuthErrorState(errorString: e.toString()));
    }
  }

  void _signInPresentHandler(event, emit) async {
    emit(AuthLoadingState());

    try {
      User user = await authRepository.signInUser(event.email, event.password);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('x-auth-token', user.token);
      emit(UpdateUserData(user: user));
      emit(SignInSuccessState(user: user));
    } catch (e) {
      emit(AuthErrorState(errorString: e.toString()));
    }
  }
}
