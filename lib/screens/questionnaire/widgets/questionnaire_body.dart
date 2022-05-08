import 'package:dump_days_agilathon/screens/questionnaire/widgets/question.dart';
import 'package:dump_days_agilathon/screens/questionnaire/widgets/results.dart';
import 'package:flutter/material.dart';

class QuestionnaireBody extends StatefulWidget {
  final int currentPage;
  final VoidCallback setAnswerPicked;

  const QuestionnaireBody({
    Key? key,
    required this.currentPage,
    required this.setAnswerPicked,
  }) : super(key: key);

  @override
  State<QuestionnaireBody> createState() => _QuestionnaireBodyState();
}

class _QuestionnaireBodyState extends State<QuestionnaireBody> {
  int points = 0;
  List<int> completed = [];

  void saveAnswer(int index, bool isSelected) {
    widget.setAnswerPicked();
    setState(() {
      if (widget.currentPage == 0) {
        if (index == 0) {
          points += 3;
        } else if (index == 1) {
          points += 2;
        } else if (index == 2) {
          points += 1;
        }
      } else if (widget.currentPage == 1) {
        if (index == 1) {
          points += 1;
        }
      } else if (widget.currentPage == 2) {
        if (index == 1) {
          points += 1;
        }
      } else if (widget.currentPage == 3) {
        if (index == 1) {
          points += 1;
        } else if (index == 1) {
          points += 2;
        } else if (index == 2) {
          points += 3;
        }
      } else if (widget.currentPage == 4) {
        if (index == 1) {
          points += 1;
        }
      } else if (widget.currentPage == 5) {
        if (index == 1) {
          points += 1;
        }
      }
    });
    debugPrint("saveAnswer $points");
  }

  List<String> getAnswers() {
    switch (widget.currentPage) {
      case 0:
        return [
          "Within 5 minutes",
          "6 to 30 minutes",
          "31 to 60 minutes",
          "After 60 minutes"
        ];
      case 1:
        return ["No", "Yes"];
      case 2:
        return ["The first one in the morning", "Any other"];
      case 3:
        return ["10 or less", "11 to 20", "21 to 30", "31 or more"];
      case 4:
        return ["No", "Yes"];
      case 5:
        return ["No", "Yes"];
      default:
        return ["No", "Yes"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.currentPage,
      children: [
        Question(
          answers: getAnswers(),
          onTapHandler: saveAnswer,
        ),
        Question(
          answers: getAnswers(),
          onTapHandler: saveAnswer,
        ),
        Question(
          answers: getAnswers(),
          onTapHandler: saveAnswer,
        ),
        Question(
          answers: getAnswers(),
          onTapHandler: saveAnswer,
        ),
        Question(
          answers: getAnswers(),
          onTapHandler: saveAnswer,
        ),
        Question(
          answers: getAnswers(),
          onTapHandler: saveAnswer,
        ),
        Results(score: points),
      ],
    );
  }
}
