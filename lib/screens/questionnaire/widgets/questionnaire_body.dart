import 'package:dump_days_agilathon/providers/questionnaire.dart';
import 'package:dump_days_agilathon/screens/questionnaire/widgets/question.dart';
import 'package:dump_days_agilathon/screens/questionnaire/widgets/results.dart';
import 'package:dump_days_agilathon/theme/size.dart';
import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionnaireBody extends StatelessWidget {
  const QuestionnaireBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qStateProvider = context.watch<QuestionnaireState>();
    return SizedBox(
      height: MSize.height * 0.7,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              context.read<QuestionnaireState>().getTitle(),
              style: MTextStyles.largeBlack,
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: qStateProvider.currentQuestion,
              children: [
                Question(
                  answers: context.watch<QuestionnaireState>().getAnswers(),
                  onTapHandler: (index, isSelected) => context
                      .read<QuestionnaireState>()
                      .saveAnswer(index, isSelected),
                ),
                Question(
                  answers: context.watch<QuestionnaireState>().getAnswers(),
                  onTapHandler: (index, isSelected) => context
                      .read<QuestionnaireState>()
                      .saveAnswer(index, isSelected),
                ),
                Question(
                  answers: context.watch<QuestionnaireState>().getAnswers(),
                  onTapHandler: (index, isSelected) => context
                      .read<QuestionnaireState>()
                      .saveAnswer(index, isSelected),
                ),
                Question(
                  answers: context.watch<QuestionnaireState>().getAnswers(),
                  onTapHandler: (index, isSelected) => context
                      .read<QuestionnaireState>()
                      .saveAnswer(index, isSelected),
                ),
                Question(
                  answers: context.watch<QuestionnaireState>().getAnswers(),
                  onTapHandler: (index, isSelected) => context
                      .read<QuestionnaireState>()
                      .saveAnswer(index, isSelected),
                ),
                Question(
                  answers: context.watch<QuestionnaireState>().getAnswers(),
                  onTapHandler: (index, isSelected) => context
                      .read<QuestionnaireState>()
                      .saveAnswer(index, isSelected),
                ),
                const Results(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
