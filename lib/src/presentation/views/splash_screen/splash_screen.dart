import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterzon/src/config/router/app_router_constants.dart';
import 'package:flutterzon/src/logic/blocs/page_redirection_cubit/page_redirection_cubit.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // context.read<PageRedirectionCubit>().redirectUser();
    // return Scaffold(
    //   body: BlocConsumer<PageRedirectionCubit, PageRedirectionState>(
    //     listener: (context, state) {
    //       if (state is PageRedirectionSuccess) {
    //         if (state.userType == 'admin') {
    //           print('this is the admin');
    //         } else if (state.userType == '' || state.userType == 'invalid') {
    //           // context.goNamed(AppRouteConstants.authRoute.name);
    //           print('this is an error');
    //         }
    //       } else {
    //         print('bottom route name');
    //       }
    //       if (state is PageRedirectionInvalid) {
    //         print('page Redirect invalid');
    //       }
    //     },
    //     builder: ((context, state) {
    //       return Scaffold(
    //         body: Center(
    //           child: Image.asset(
    //             'assets/images/amazon_in_alt.png',
    //             height: 52,
    //           ),
    //         ),
    //       );
    //     }),
    //   ),
    // );

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/amazon_in_alt.png',
          height: 52,
        ),
      ),
    );
  }
}
