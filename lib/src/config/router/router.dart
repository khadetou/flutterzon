import 'package:flutter/material.dart';
import 'package:flutterzon/src/config/router/app_router_constants.dart';
import 'package:flutterzon/src/presentation/views/auth/auth_screen.dart';
import 'package:flutterzon/src/presentation/views/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: AppRouteConstants.splashScreen.name,
      path: AppRouteConstants.splashScreen.path,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: SplashScreen(),
        );
      },
    ),
    GoRoute(
      name: AppRouteConstants.authRoute.name,
      path: AppRouteConstants.authRoute.path,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: AuthScreen(),
        );
      },
    ),
  ],
);
