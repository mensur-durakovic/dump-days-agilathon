import 'package:dump_days_agilathon/theme/text_styles.dart';
import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:flutter/material.dart';

class MInputDecoration {
  static InputDecoration textFieldStyle({
    required String labelText,
    required IconData icon,
    String errorText = "",
    String prefix = "",
    required VoidCallback onTap,
  }) {
    return InputDecoration(
      errorText: errorText,
      suffixIcon: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: MColors.darkGray),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: MColors.inputHintColor),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: MColors.darkGray),
      ),
      prefixText: prefix,
      labelText: labelText,
      labelStyle: MTextStyles.mediumPaleGrey,
      hintStyle: TextStyle(color: MColors.inputHintColor),
    );
  }
}
