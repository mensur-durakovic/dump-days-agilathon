import 'package:dump_days_agilathon/providers/home.dart';
import 'package:dump_days_agilathon/providers/questionnaire.dart';
import 'package:dump_days_agilathon/screens/home/page/home_screen.dart';
import 'package:dump_days_agilathon/screens/questionnaire/page/questionnaire_screen.dart';
import 'package:dump_days_agilathon/screens/splash/splash_screen.dart';
import 'package:dump_days_agilathon/screens/thank_you/thank_you_screen.dart';
import 'package:dump_days_agilathon/utils/constants.dart';
import 'package:dump_days_agilathon/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeState>(
          create: (_) => HomeState(),
        ),
        ChangeNotifierProvider<QuestionnaireState>(
          create: (_) => QuestionnaireState(),
        ),
      ],
      child: const MyApp(),
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      routes: [
        GoRoute(
          name: MRoutes.root.name,
          path: MRoutes.root.path,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: MRoutes.home.name,
          path: MRoutes.home.path,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: MRoutes.thankYou.name,
          path: MRoutes.thankYou.path,
          builder: (context, state) => const ThankYouScreen(),
        ),
        GoRoute(
          name: MRoutes.questionnaire.name,
          path: MRoutes.questionnaire.path,
          builder: (context, state) => const QuestionnaireScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: kAppTitle,
    );
  }
}
