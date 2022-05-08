import 'package:dump_days_agilathon/core/inputs/date_input.dart';
import 'package:dump_days_agilathon/core/inputs/text_input.dart';
import 'package:dump_days_agilathon/core/widgets/app_bar.dart';
import 'package:dump_days_agilathon/core/widgets/button.dart';
import 'package:dump_days_agilathon/screens/questionnaire/widgets/question.dart';
import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:dump_days_agilathon/theme/size.dart';
import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:dump_days_agilathon/utils/constants.dart';
import 'package:dump_days_agilathon/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String participantNumber = "";
  String visitNumber = "";
  String assessmentDate = "";
  String smokeFlag = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: buildBody(context),
    );
  }

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
    smokeFlag = index == 0 ? "yes" : 'no';
  }

  void logData() {
    debugPrint("participantNumber $participantNumber");
    debugPrint("visitNumber $visitNumber");
    debugPrint("assessmentDate $assessmentDate");
    debugPrint("smokeFlag $smokeFlag");
  }

  void confirmHandler() {
    logData();
    if (!validation()) {
      showToastMessage(kPleaseFillOutAllTheFields);
      return;
    }
    GoRouter.of(context)
        .pushNamed(smokeFlag == 'yes' ? 'questionnaire' : 'thankYou');
  }

  Widget buildBody(BuildContext context) {
    MSize.setSize(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Text(
                    kFillOutBellowInfo,
                    style: MTextStyles.largeBlack,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            TextInput(
              labelText: kParticipantNumber,
              onChange: participantNumberHandler,
              icon: Icons.numbers,
              keyboardType: TextInputType.number,
            ),
            TextInput(
              labelText: kDoYouCurrentlySmoke,
              onChange: visitNumberHandler,
              icon: Icons.edit,
              keyboardType: TextInputType.number,
            ),
            DateInput(
              labelText: kDateOfAssesment,
              initialValue: "03.04.2022.",
              onChange: assessmentDateHandler,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    kDoYouCurrentlySmoke,
                    style: MTextStyles.mediumBlack,
                  ),
                ),
                Question(
                  answers: const ["YES", "NO"],
                  onTapHandler: smokeFlagHandler,
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              onTap: confirmHandler,
              color: MColors.mainColor,
              text: kConfirm,
              textStyle: MTextStyles.mediumWhite,
            ),
          ],
        ),
      ),
    );
  }
}
