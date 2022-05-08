import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:dump_days_agilathon/theme/size.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle textStyle;
  final VoidCallback? onTap;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MSize.width,
      child: TextButton(
        onPressed: onTap,
        child: Text(text, style: textStyle),
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(15),
        ),
      ),
    );
  }
}

class DisabledButton extends StatelessWidget {
  final String text;

  const DisabledButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MSize.width,
      child: TextButton(
        onPressed: () => {},
        child: Text(
          text,
          style: const TextStyle(
            color: MColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: MColors.darkGray,
          padding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}
