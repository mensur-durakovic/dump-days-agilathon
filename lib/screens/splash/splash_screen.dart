import 'dart:async';

import 'package:dump_days_agilathon/theme/size.dart';
import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:dump_days_agilathon/utils/assets.dart';
import 'package:dump_days_agilathon/utils/constants.dart';
import 'package:dump_days_agilathon/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<Timer> startTimer() async {
    const Duration duration = Duration(seconds: 2);
    timer = Timer(duration, redirectToHome);
    return timer;
  }

  void redirectToHome() {
    GoRouter.of(context).go(MRoutes.home.path);
  }

  @override
  Widget build(BuildContext context) {
    MSize.setSize(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  kSplashScreenTitle,
                  style: MTextStyles.veryLargeBlack,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: MSize.height * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  kAgilathonLogoPath,
                  width: MSize.width * 0.7,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
