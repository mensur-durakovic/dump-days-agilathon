import 'package:dump_days_agilathon/utils/constants.dart';
import 'package:dump_days_agilathon/utils/routes.dart';
import 'package:dump_days_agilathon/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeState with ChangeNotifier {
  String participantNumber = "";
  String visitNumber = "";
  String assessmentDate = "";
  String smokeFlag = "";

  bool validation() {
    return participantNumber.isNotEmpty &&
        visitNumber.isNotEmpty &&
        assessmentDate.isNotEmpty &&
        smokeFlag.isNotEmpty;
  }

  void participantNumberHandler(String newValue) {
    participantNumber = newValue;
  }

  void visitNumberHandler(String newValue) {
    visitNumber = newValue;
  }

  void assessmentDateHandler(String newValue) {
    assessmentDate = newValue;
  }

  void smokeFlagHandler(int index, bool isSelected) {
    smokeFlag = index == 0 ? kYes : kNo;
  }

  void logData() {
    debugPrint("participantNumber $participantNumber");
    debugPrint("visitNumber $visitNumber");
    debugPrint("assessmentDate $assessmentDate");
    debugPrint("smokeFlag $smokeFlag");
  }

  void confirmHandler(BuildContext context) {
    logData();
    final isValid = validation();
    if (!isValid) {
      showToastMessage(kPleaseFillOutAllTheFields);
      return;
    }
    final nextPage =
        smokeFlag == kYes ? MRoutes.questionnaire.name : MRoutes.thankYou.name;
    GoRouter.of(context).goNamed(nextPage);
  }

  void reset() {
    participantNumber = "";
    visitNumber = "";
    assessmentDate = "";
    smokeFlag = "";
  }
}
