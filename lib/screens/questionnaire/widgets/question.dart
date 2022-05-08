import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class Question extends StatelessWidget {
  final List<String> answers;
  final Function(int, bool) onTapHandler;

  const Question({
    Key? key,
    required this.answers,
    required this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GroupButton(
        options: const GroupButtonOptions(
          direction: Axis.vertical,
          spacing: 20,
          buttonHeight: 50,
          buttonWidth: 300,
          selectedColor: MColors.mainColor,
          elevation: 2,
        ),
        isRadio: true,
        onSelected: onTapHandler,
        buttons: answers,
      ),
    );
  }
}
