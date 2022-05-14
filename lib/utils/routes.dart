class MRoute {
  final String name;
  final String path;

  const MRoute({
    required this.name,
    required this.path,
  });
}

class MRoutes {
  static const root = MRoute(
    name: 'root',
    path: '/',
  );
  static const home = MRoute(
    name: 'home',
    path: '/home',
  );
  static const thankYou = MRoute(
    name: 'thankYou',
    path: '/thankYou',
  );
  static const questionnaire = MRoute(
    name: 'questionnaire',
    path: '/questionnaire',
  );
}
