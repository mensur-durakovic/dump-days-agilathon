import 'package:date_time_picker/date_time_picker.dart';
import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  final String initialValue;
  final String hintText;
  final Function(String) onChange;

  const DateInput({
    Key? key,
    this.initialValue = '',
    required this.hintText,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
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
        hoverColor: MColors.mainColor,
        prefixIcon: const Icon(
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
      //locale: Locale('pt', 'BR'),
      onChanged: (val) => onChange(val),
      validator: (val) {
        //setState(() => _valueToValidate1 = val ?? '');
        return null;
      },
    );
  }
}
