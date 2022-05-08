import 'package:dump_days_agilathon/core/widgets/app_bar.dart';
import 'package:dump_days_agilathon/core/widgets/button.dart';
import 'package:dump_days_agilathon/screens/questionnaire/widgets/questionnaire_body.dart';
import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:dump_days_agilathon/utils/constants.dart';
import 'package:dump_days_agilathon/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int currentQuestion = 0;
  List<bool> answerPicked = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: buildBody(context),
    );
  }

  String getTitle() {
    final questionText = questions[currentQuestion];
    return questionText ?? '';
  }

  void setAnswerPicked() {
    setState(() {
      answerPicked[currentQuestion] = true;
    });
  }

  void nextHandler() {
    if (currentQuestion > 5) {
      GoRouter.of(context).pushNamed('thankYou');
      return;
    }

    if (!answerPicked[currentQuestion]) {
      showToastMessage(kPleaseFillOutAllTheFields);
      return;
    }
    if (currentQuestion <= 5) {
      setState(() {
        currentQuestion++;
      });
    }
  }

  Future<bool> previousHandler() async {
    if (currentQuestion == 0) {
      return true;
    }
    if (currentQuestion > 0) {
      setState(() {
        currentQuestion--;
      });
    }
    return false;
  }

  Widget buildBody(BuildContext context) {
    return WillPopScope(
      onWillPop: previousHandler,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  getTitle(),
                  style: MTextStyles.largeBlack,
                ),
              ),
              QuestionnaireBody(
                currentPage: currentQuestion,
                setAnswerPicked: setAnswerPicked,
              ),
              const Spacer(),
              CustomButton(
                onTap: nextHandler,
                color: MColors.mainColor,
                text: kConfirm,
                textStyle: MTextStyles.mediumWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
