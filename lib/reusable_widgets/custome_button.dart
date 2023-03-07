import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function()? buttonFunction;
  String textString;
  double textSize, buttonWidth, buttonHeight;
  Color buttonColor, textColor;
  FontWeight textWeight;
  // bool isLoading;

  CustomButton({
    Key? key,
    required this.buttonFunction,
    // required this.isLoading,
    required this.textString,
    required this.buttonColor,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.textColor,
    required this.textSize,
    required this.textWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(100),
      //     // border: Border.all(width: 1,color: Color(0xffDCE000))
      // ),
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(buttonWidth, buttonHeight),
            backgroundColor: buttonColor,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(100),
            // )
            ),
        child:
        Text(
          textString,
          style: TextStyle(
            fontSize: textSize, color: textColor, fontWeight: textWeight,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
