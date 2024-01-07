import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterzon/src/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutterzon/src/logic/blocs/auth_bloc/radio_bloc/radio_bloc.dart';
import 'package:flutterzon/src/presentation/widgets/common_widgets/custom_elevated_button.dart';
import 'package:flutterzon/src/presentation/widgets/common_widgets/custom_textfield.dart';
import 'package:flutterzon/src/utils/constants/constants.dart';
import 'package:flutterzon/src/utils/utils.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<RadioBloc>().add(const RadioChangedEvent(auth: Auth.signUp));

    return Scaffold(
      backgroundColor: Constants.greyBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/amazon_in.png',
                  width: 50,
                  height: 40,
                ),
                const SizedBox.square(
                  dimension: 12.0,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox.square(
                  dimension: 12.0,
                ),

                // Sign Up Section
                BlocBuilder<RadioBloc, RadioState>(
                  builder: (context, state) {
                    if (state is RadioSignUpState) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: 10, right: 8, left: 8),
                            decoration: BoxDecoration(
                              color: Constants.greyBackgroundColor,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  minLeadingWidth: 2.0,
                                  leading: SizedBox.square(
                                    dimension: 12.0,
                                    child: Radio(
                                      value: Auth.signUp,
                                      groupValue: state.auth,
                                      onChanged: (Auth? val) {
                                        context.read<RadioBloc>().add(
                                              RadioChangedEvent(auth: val!),
                                            );
                                      },
                                    ),
                                  ),
                                  title: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Create Account. ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'New to Amazon?',
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<RadioBloc>().add(
                                          const RadioChangedEvent(
                                            auth: Auth.signUp,
                                          ),
                                        );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              bottom: 10.0,
                              right: 8,
                              left: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Constants.backgroundColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  minLeadingWidth: 2.0,
                                  leading: SizedBox.square(
                                    dimension: 12.0,
                                    child: Radio(
                                      value: Auth.signIn,
                                      groupValue: state.auth,
                                      onChanged: (Auth? val) {
                                        context.read<RadioBloc>().add(
                                              RadioChangedEvent(auth: val!),
                                            );
                                      },
                                    ),
                                  ),
                                  title: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Sign In. ',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Already a Customer?',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<RadioBloc>().add(
                                          const RadioChangedEvent(
                                            auth: Auth.signUp,
                                          ),
                                        );
                                  },
                                ),
                                Form(
                                  key: _signUpFormKey,
                                  child: Column(
                                    children: <Widget>[
                                      CustomTextField(
                                        controller: _nameController,
                                        hintText: 'First and last name',
                                        onChanged: (value) {
                                          context.read<AuthBloc>().add(
                                                TextFieldChangeEvent(
                                                  _emailController.text,
                                                  _nameController.text,
                                                  _passwordController.text,
                                                ),
                                              );
                                        },
                                      ),
                                      CustomTextField(
                                        controller: _emailController,
                                        hintText: 'email',
                                        onChanged: (value) {
                                          context.read<AuthBloc>().add(
                                                TextFieldChangeEvent(
                                                  _emailController.text,
                                                  _nameController.text,
                                                  _passwordController.text,
                                                ),
                                              );
                                        },
                                      ),
                                      CustomTextField(
                                        controller: _passwordController,
                                        hintText: 'Password',
                                        onChanged: (value) {
                                          context.read<AuthBloc>().add(
                                                TextFieldChangeEvent(
                                                  _emailController.text,
                                                  _nameController.text,
                                                  _passwordController.text,
                                                ),
                                              );
                                        },
                                      ),
                                      const SizedBox.square(
                                        dimension: 10.0,
                                      ),
                                      BlocBuilder<AuthBloc, AuthState>(
                                        builder: (context, state) {
                                          if (state is TextFieldErrorState) {
                                            return Row(
                                              children: <Widget>[
                                                Image.asset(
                                                  'asset/images/info_icon.png',
                                                  height: 15,
                                                  width: 15,
                                                ),
                                                Text(' ${state.errorString}')
                                              ],
                                            );
                                          } else {
                                            if (_nameController.text == '' ||
                                                _emailController.text == '' ||
                                                _passwordController.text ==
                                                    '') {
                                              return Row(
                                                children: <Widget>[
                                                  Image.asset(
                                                    'assets/images/info_icon.png',
                                                    height: 15.0,
                                                    width: 15.0,
                                                  ),
                                                  const Text(
                                                      ' All fields are required.'),
                                                ],
                                              );
                                            }
                                          }
                                          return const SizedBox();
                                        },
                                      ),
                                      const SizedBox.square(
                                        dimension: 15.0,
                                      ),

                                      BlocConsumer<AuthBloc, AuthState>(
                                        builder: (context, state) {
                                          if (state is AuthLoadingState) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            return CustomElevatedButton(
                                              buttonText: 'Create account',
                                              onPressed: () {
                                                if (_signUpFormKey.currentState!
                                                    .validate()) {
                                                  BlocProvider.of<AuthBloc>(
                                                          context)
                                                      .add(
                                                    CreatedAccountPresentEvent(
                                                        _nameController.text,
                                                        _emailController.text,
                                                        _passwordController
                                                            .text),
                                                  );
                                                }
                                              },
                                            );
                                          }
                                        },
                                        listener: (context, state) {
                                          if (state is AuthErrorState) {
                                            debugPrint(state.errorString);
                                            showSnackBar(
                                                context, state.errorString);
                                          }
                                          if (state is CreateUserSuccessState) {
                                            showSnackBar(context,
                                                state.userCreateString);
                                          }
                                          if (state is CreateUserErrorState) {
                                            showSnackBar(
                                                context, state.errorString);
                                          }
                                        },
                                      ),
                                      // BlocConsumer<AuthBloc, AuthState>(
                                      //   builder: (context, state) {
                                      //     if (state is AuthLoadingState) {
                                      //       return const Center(
                                      //         child:
                                      //             CircularProgressIndicator(),
                                      //       );
                                      //     } else {
                                      //       return CustomElevatedButton(
                                      //         buttonText: 'Continue',
                                      //         onPressed: () {
                                      //           if (_signUpFormKey.currentState!
                                      //               .validate()) {
                                      //             BlocProvider.of<AuthBloc>(
                                      //                     context)
                                      //                 .add(
                                      //               SignInPresentEvent(
                                      //                 _emailController.text,
                                      //                 _passwordController.text,
                                      //               ),
                                      //             );
                                      //           }
                                      //         },
                                      //       );
                                      //     }
                                      //   },
                                      //   listener: (context, state) {
                                      //     if (state is AuthErrorState) {
                                      //       // showSnackBar()
                                      //     }
                                      //   },
                                      // ) // this is for the signIn
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is RadioSingInState) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              bottom: 10.0,
                              right: 8,
                              left: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Constants.greyBackgroundColor,
                              borderRadius: BorderRadius.circular(
                                6,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  minLeadingWidth: 2,
                                  leading: SizedBox.square(
                                    dimension: 12,
                                    child: Radio(
                                      value: Auth.signUp,
                                      groupValue: state.auth,
                                      onChanged: (Auth? val) {
                                        context.read<RadioBloc>().add(
                                              RadioChangedEvent(auth: val!),
                                            );
                                      },
                                    ),
                                  ),
                                  title: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Create Account. ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'New to Amazon',
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    context.read<RadioBloc>().add(
                                        const RadioChangedEvent(
                                            auth: Auth.signUp));
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: 10, right: 8, left: 8),
                            decoration: BoxDecoration(
                              color: Constants.greyBackgroundColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  minLeadingWidth: 2,
                                  leading: SizedBox.square(
                                    dimension: 12,
                                    child: Radio(
                                      value: Auth.signIn,
                                      groupValue: state.auth,
                                      onChanged: (Auth? val) {
                                        context.read<RadioBloc>().add(
                                              RadioChangedEvent(auth: val!),
                                            );
                                      },
                                    ),
                                  ),
                                  title: RichText(
                                    text: const TextSpan(children: [
                                      TextSpan(
                                        text: 'Sign In. ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Already a customer? ',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  onTap: () {
                                    context.read<RadioBloc>().add(
                                          const RadioChangedEvent(
                                            auth: Auth.signIn,
                                          ),
                                        );
                                  },
                                ),
                                Form(
                                  key: _signInFormKey,
                                  child: Column(
                                    children: <Widget>[
                                      CustomTextField(
                                        controller: _emailController,
                                        hintText: 'Email',
                                      ),
                                      CustomTextField(
                                        controller: _passwordController,
                                        hintText: 'Password',
                                      ),
                                      BlocConsumer<AuthBloc, AuthState>(
                                          builder: (context, state) {
                                        if (state is AuthLoadingState) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return CustomElevatedButton(
                                            buttonText: 'Continue',
                                            onPressed: () {
                                              if (_signInFormKey.currentState!
                                                  .validate()) {
                                                BlocProvider.of<AuthBloc>(
                                                        context)
                                                    .add(
                                                  SignInPresentEvent(
                                                    _emailController.text,
                                                    _passwordController.text,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        }
                                      }, listener: (context, state) {
                                        if (state is AuthErrorState) {
                                          showSnackBar(
                                              context, state.errorString);
                                        }
                                        if (state is SignInSuccessState) {
                                          // BlocProvider.of<UserCubit>(context) Next create the userCubit Bloc
                                        }
                                      })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const Center(
                  child: Text('Auth  Screen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
