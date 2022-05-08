import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int score;
  const Results({
    Key? key,
    required this.score,
  }) : super(key: key);

  String getDependenceByScore() {
    if (score >= 1 && score <= 2) {
      return "You score $score points. This is low dependence!";
    } else if (score >= 3 && score <= 4) {
      return "You score $score points. This is low to moderate dependence!";
    } else if (score >= 5 && score <= 7) {
      return "You score $score points. This is moderate dependence!";
    } else if (score >= 8) {
      return "You score $score points. This is high dependence!";
    }
    return "N/A";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        getDependenceByScore(),
        style: MTextStyles.largeBlack,
        textAlign: TextAlign.center,
      ),
    );
  }
}
