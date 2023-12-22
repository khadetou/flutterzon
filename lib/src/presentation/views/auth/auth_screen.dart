import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterzon/src/logic/blocs/auth_bloc/radio_bloc/radio_bloc.dart';
import 'package:flutterzon/src/utils/constants/constants.dart';

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
                                          text: 'Create account. ',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'New to Amazon?',
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
                                      // proceed here with the CustomTextField class
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
