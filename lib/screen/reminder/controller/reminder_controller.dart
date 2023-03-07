import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderController extends GetxController{


  DateTime selectedDate = DateTime.now();


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.grey,
            splashColor: Colors.black,
            textTheme: TextTheme(
              subtitle1: TextStyle(color: Colors.black),
              button: TextStyle(color: Colors.black),
            ),
            accentColor: Colors.black,
            colorScheme: ColorScheme.light(
                primary: Colors.green,
                primaryVariant: Colors.black,
                secondaryVariant: Colors.black,
                onSecondary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: Colors.black,
                secondary: Colors.black),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ?? Text(""),
        );
      },
      initialDate: selectedDate,
      firstDate:DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
    {
      DateTime date_format= DateTime.parse(picked.toString());
      // var dtnew = DateFormat('MM/dd/yyyy').format(picked);
      //when_is_it.text = date_format.toString();
    }
  }

}