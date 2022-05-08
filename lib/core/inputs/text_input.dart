import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final String initialText;
  final Function(String) onChange;
  final IconData icon;
  final String hintText;
  final TextInputType keyboardType;
  final double bottomPadding;

  const TextInput({
    Key? key,
    required this.labelText,
    required this.onChange,
    this.initialText = "",
    this.hintText = "",
    this.icon = Icons.edit,
    this.keyboardType = TextInputType.text,
    this.bottomPadding = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: TextFormField(
        onChanged: onChange,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(2.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MColors.mainColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: MColors.mainColor,
          ),
          labelStyle: const TextStyle(fontSize: 15),
          prefixIcon: Icon(
            icon,
            color: MColors.mainColor,
          ),
        ),
        cursorColor: MColors.mainColor,
        keyboardType: keyboardType,
      ),
    );
  }
}
