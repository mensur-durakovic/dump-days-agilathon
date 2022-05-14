import 'package:flutter/cupertino.dart';

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

class QuestionnaireState with ChangeNotifier {}
