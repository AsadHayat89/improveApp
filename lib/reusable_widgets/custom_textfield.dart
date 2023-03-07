import 'package:flutter/material.dart';
import 'package:improvescap/utils/colors.dart';

class CustomeTextfield extends StatelessWidget {
  var hinttext;
  var suficIcons;
  var prefixIcon;
  var controller;
  var valid;
  final onChanged;
  CustomeTextfield({this.hinttext,this.suficIcons,this.prefixIcon,this.controller,
    this.valid,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        validator: valid,
        controller: controller,
      onChanged: onChanged,
      //obscureText: obscTextTrue,
      style: TextStyle(
        color: AppColors.whitekColor
      ),
      decoration: InputDecoration(
        hintText: hinttext,
        suffixIcon: suficIcons,
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(
          color: AppColors.whitekColor
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: AppColors.borderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: AppColors.borderColor)),
      ),
    );
  }
}


class CustomPasswordTextfield extends StatelessWidget {
  var hinttext;
  var suficIcons;
  var prefixIcon;
  final obscTextTrue;
  var controller;
  var valid;
  CustomPasswordTextfield({this.hinttext,this.suficIcons,this.prefixIcon,
    this.valid,
    this.obscTextTrue,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: controller,
      obscureText: obscTextTrue,
      style: TextStyle(
          color: AppColors.whitekColor
      ),
      decoration: InputDecoration(
        hintText: hinttext,
        suffixIcon: suficIcons,
        prefixIcon: prefixIcon,

        hintStyle: TextStyle(
            color: AppColors.whitekColor
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: AppColors.borderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: AppColors.borderColor)),
      ),
    );
  }
}

