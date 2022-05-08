import 'package:dump_days_agilathon/screens/home/page/home_screen.dart';
import 'package:dump_days_agilathon/screens/questionnaire/page/questionnaire_screen.dart';
import 'package:dump_days_agilathon/screens/splash/splash_screen.dart';
import 'package:dump_days_agilathon/screens/thank_you/thank_you_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      routes: [
        GoRoute(
          name: 'root',
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: 'home',
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: 'thankYou',
          path: '/thank-you',
          builder: (context, state) => const ThankYouScreen(),
        ),
        GoRoute(
          name: 'questionnaire',
          path: '/questionnaire',
          builder: (context, state) => const QuestionnaireScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Nicotine dependency study',
    );
  }
}
