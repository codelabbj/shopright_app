import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../theme/app_colors.dart';

class DateOfBirthField extends StatefulWidget {
  @override
  _DateOfBirthFieldState createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  TextEditingController _controller = TextEditingController();
  DateTime? selectedDate;

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            textTheme: TextTheme(
              titleLarge: Theme.of(context).textTheme.labelMedium!.copyWith(
                    // fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              bodyLarge: Theme.of(context).textTheme.labelSmall!.copyWith(
                    // fontSize: 16,
                    color: Colors.grey[800],
                  ),
            ),
            colorScheme: ColorScheme.light(
              primary: AppColors.PRIMARY_BLUE_COLOR, // ✅ Header color
              onPrimary: Colors.white, // ✅ Header text color
              onSurface: Colors.black, // ✅ Body text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _clearDate() {
    setState(() {
      selectedDate = null;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: 'Date of birth',
      hintText: 'Y-m-d',
      controller: _controller,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
              onTap: () => _selectDate(context),
              child: Image.asset(
                "assets/images/calendar.png",
                width: 24,
                height: 24,
              )),

          // IconButton(
          //   icon: Icon(Icons.calendar_today),
          //   onPressed: () => _selectDate(context),
          // ),
          IconButton(
            icon: Icon(Icons.clear, color: Colors.red),
            onPressed: _clearDate,
          ),
        ],
      ),
    );
  }
}
