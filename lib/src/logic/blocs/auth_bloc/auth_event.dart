part of "auth_bloc.dart";

@immutable
sealed class AuthEvent extends Equatable {}

class TextFieldChangeEvent extends AuthEvent {
  final String nameValue;
  final String emailValue;
  final String passwordValue;

  TextFieldChangeEvent(this.emailValue, this.nameValue, this.passwordValue);

  @override
  List<Object> get props => [emailValue, nameValue, passwordValue];
}

class CreatedAccountPresentEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  CreatedAccountPresentEvent(this.name, this.email, this.password);

  @override
  List<Object> get props => [name, email, password];
}

class SignInPresentEvent extends AuthEvent {
  final String email;
  final String passowrd;

  SignInPresentEvent(this.email, this.passowrd);

  @override
  List<Object> get props => [email, passowrd];
}
