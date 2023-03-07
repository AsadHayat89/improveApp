import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/screen/profile/view/profile_screen.dart';
import '../generated/assert.dart';
import '../utils/colors.dart';

class CusttomAppBar{
  buildAppBar({required String text}) {
    return
      AppBar(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      automaticallyImplyLeading: false,

      title: Text(text,style: GoogleFonts.outfit(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: AppColors.whitekColor,
      ),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
          child: InkWell(
            onTap: (){
              Get.to(()=>ProfileScreen());
            },
              child: Image.asset(ImageConstant.profile)),
        )
      ],
    );
  }
}