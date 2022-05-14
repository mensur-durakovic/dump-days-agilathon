import 'package:dump_days_agilathon/core/widgets/app_bar.dart';
import 'package:dump_days_agilathon/core/widgets/button.dart';
import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:dump_days_agilathon/utils/constants.dart';
import 'package:dump_days_agilathon/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  kThankYouForParticipating,
                  style: MTextStyles.largeBlack,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () => GoRouter.of(context).goNamed(MRoutes.home.name),
                color: MColors.mainColor,
                text: kTryAgain,
                textStyle: MTextStyles.mediumWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
