import 'package:dump_days_agilathon/core/inputs/date_input.dart';
import 'package:dump_days_agilathon/core/inputs/text_input.dart';
import 'package:dump_days_agilathon/core/widgets/app_bar.dart';
import 'package:dump_days_agilathon/core/widgets/button.dart';
import 'package:dump_days_agilathon/providers/home.dart';
import 'package:dump_days_agilathon/screens/questionnaire/widgets/question.dart';
import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:dump_days_agilathon/theme/size.dart';
import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:dump_days_agilathon/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  onChange: homeState.participantNumberHandler,
                  icon: Icons.numbers,
                  initialText: homeState.participantNumber,
                  keyboardType: TextInputType.number,
                ),
                TextInput(
                  labelText: kVisitNumber,
                  onChange: homeState.visitNumberHandler,
                  icon: Icons.edit,
                  initialText: homeState.visitNumber,
                  keyboardType: TextInputType.number,
                ),
                DateInput(
                  hintText: kDateOfAssessment,
                  initialValue: homeState.assessmentDate,
                  onChange: homeState.assessmentDateHandler,
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
                      answers: [kYes.toUpperCase(), kNo.toUpperCase()],
                      onTapHandler: homeState.smokeFlagHandler,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    kAllFieldsMustBeFilled,
                    style: MTextStyles.mediumBlack.copyWith(color: Colors.red),
                  ),
                ),
                SizedBox(height: MSize.height * 0.25),
                CustomButton(
                  onTap: () => homeState.confirmHandler(context),
                  color: MColors.mainColor,
                  text: kConfirm,
                  textStyle: MTextStyles.mediumWhite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
