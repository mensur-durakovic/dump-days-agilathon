import 'package:dump_days_agilathon/core/widgets/app_bar.dart';
import 'package:dump_days_agilathon/core/widgets/button.dart';
import 'package:dump_days_agilathon/providers/questionnaire.dart';
import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:dump_days_agilathon/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/questionnaire_body.dart';

class QuestionnaireScreen extends StatelessWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qStateProvider = Provider.of<QuestionnaireState>(context);
    final currQuestion = context.read<QuestionnaireState>().currentQuestion;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: WillPopScope(
        onWillPop: qStateProvider.previousHandler,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const QuestionnaireBody(),
                const Spacer(),
                Row(
                  children: [
                    if (currQuestion != 0 && currQuestion != 6)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: CustomButton(
                            onTap: () => qStateProvider.previousHandler(),
                            color: MColors.mainColor,
                            text: kBack,
                            textStyle: MTextStyles.mediumWhite,
                          ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: CustomButton(
                          onTap: () => qStateProvider.nextHandler(context),
                          color: MColors.mainColor,
                          text: kNext,
                          textStyle: MTextStyles.mediumWhite,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
