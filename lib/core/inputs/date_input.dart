import 'package:date_time_picker/date_time_picker.dart';
import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final String initialText;
  final Function(String) onChange;

  const DateInput({
    Key? key,
    required this.initialValue,
    required this.labelText,
    required this.onChange,
    this.initialText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(2.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MColors.mainColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        hintText: "Time",
        hoverColor: MColors.mainColor,
        prefixIcon: Icon(
          Icons.date_range_rounded,
          color: MColors.mainColor,
        ),
      ),
      type: DateTimePickerType.date,
      dateMask: 'dd.MM.yyyy.',
      initialValue: initialValue,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: const Icon(Icons.event),
      dateLabelText: labelText,
      //locale: Locale('pt', 'BR'),
      onChanged: (val) => onChange(val),
      validator: (val) {
        //setState(() => _valueToValidate1 = val ?? '');
        return null;
      },
    );
  }
}
