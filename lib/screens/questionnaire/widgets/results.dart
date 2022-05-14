import 'package:dump_days_agilathon/providers/questionnaire.dart';
import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qStateProvider = Provider.of<QuestionnaireState>(context);
    return Center(
      child: Text(
        qStateProvider.getDependenceByScore(),
        style: MTextStyles.largeBlack,
        textAlign: TextAlign.center,
      ),
    );
  }
}
