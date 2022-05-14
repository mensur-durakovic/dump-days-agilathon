import 'package:dump_days_agilathon/utils/constants.dart';
import 'package:dump_days_agilathon/utils/routes.dart';
import 'package:dump_days_agilathon/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

const totalQuestions = 6;
const lastQuestionIndex = 5;
final pointsPerQuestions = {
  0: [3, 2, 1],
  1: [0, 1],
  2: [0, 1],
  3: [0, 1, 2, 3],
  4: [0, 1],
  5: [0, 1],
};

class QuestionnaireState with ChangeNotifier {
  int currentQuestion = 0;
  List<dynamic> answersPicked =
      List<dynamic>.generate(totalQuestions, (i) => null);

  String getTitle() {
    final questionText = kQuestions[currentQuestion];
    return questionText ?? '';
  }

  void setAnswerPicked(int index) {
    debugPrint("answersPicked before: ${answersPicked.toString()}");
    answersPicked[currentQuestion] = index;
    debugPrint("answersPicked after: ${answersPicked.toString()}");
    notifyListeners();
  }

  void nextHandler(BuildContext context) {
    if (currentQuestion > lastQuestionIndex) {
      reset();
      GoRouter.of(context).pushNamed(MRoutes.thankYou.name);
      return;
    }

    if (answersPicked[currentQuestion] == null) {
      showToastMessage(kPleaseFillOutAllTheFields);
      return;
    }
    if (currentQuestion <= lastQuestionIndex) {
      currentQuestion++;
    }
    notifyListeners();
  }

  Future<bool> previousHandler() async {
    if (currentQuestion == 0) {
      return true;
    }
    if (currentQuestion > 0) {
      currentQuestion--;
    }

    notifyListeners();
    return false;
  }

  void saveAnswer(int index, bool isSelected) {
    setAnswerPicked(index);
    notifyListeners();
  }

  List<String> getAnswers() {
    final answers = kAnswers[currentQuestion];
    return answers ?? [];
  }

  int calculateDependencyPoints() {
    int points = 0;
    for (int i = 0; i < totalQuestions; i++) {
      int answerPicked = answersPicked[i];
      List<int> questionPoints = pointsPerQuestions[i] as List<int>;
      int scoredPoints = questionPoints[answerPicked];
      debugPrint("question ${i + 1}, points: $scoredPoints");
      points += scoredPoints;
    }
    return points;
  }

  String getDependenceByScore() {
    if (currentQuestion < totalQuestions) {
      return "";
    }

    int points = calculateDependencyPoints();
    if (points >= 1 && points <= 2) {
      return "You score $points points. This is low dependence!";
    } else if (points >= 3 && points <= 4) {
      return "You score $points points. This is low to moderate dependence!";
    } else if (points >= 5 && points <= 7) {
      return "You score $points points. This is moderate dependence!";
    } else if (points >= 8) {
      return "You score $points points. This is high dependence!";
    }
    return "N/A";
  }

  void reset() {
    currentQuestion = 0;
    answersPicked = List<dynamic>.generate(totalQuestions, (i) => null);
  }
}
