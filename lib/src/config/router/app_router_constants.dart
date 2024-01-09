class AppRoute {
  const AppRoute({required this.name, required this.path});
  final String name;
  final String path;
}

class AppRouteConstants {
  static const splashScreen = AppRoute(name: 'splash-screen', path: '/');
  static const authRoute = AppRoute(name: "auth-screen", path: "/auth-screen");
  static const bottomBarRoute = AppRoute(name: 'bottomBar', path: '/bottomBar');
  static const adminBottomBarRoute =
      AppRoute(name: 'admin-bottom-bar', path: '/admin-bottom-bar');
}
