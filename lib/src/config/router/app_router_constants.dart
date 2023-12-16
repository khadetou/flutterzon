class AppRoute {
  const AppRoute({required this.name, required this.path});
  final String name;
  final String path;
}

class AppRouteConstants {
  static const splashScreen = AppRoute(name: 'splash-screen', path: '/');
}
