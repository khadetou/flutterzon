import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutterzon/src/data/models/user.dart";
import "package:flutterzon/src/data/repositories/auth_repository.dart";
import "package:flutterzon/src/data/repositories/user_repository.dart";
import "package:shared_preferences/shared_preferences.dart";
part 'page_redirection_state.dart';

class PageRedirectionCubit extends Cubit<PageRedirectionState> {
  PageRedirectionCubit(this.authRepository) : super(PageRedirectionInitial());

  UserRepository userRepository = UserRepository();

  final AuthRepository authRepository;

  void redirectUser() async {
    bool isValid;
    String userType;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
        token = '';
      }
      isValid = await authRepository.isTokenValid(token: token);

      if (isValid == true) {
        User user = await userRepository.getUserDataInitial(token);
        userType = user.type;
        emit(PageRedirectionSuccess(isValid: isValid, userType: userType));
      } else {
        emit(PageRedirectionInvalid(isValid: isValid, userType: 'invalid'));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
