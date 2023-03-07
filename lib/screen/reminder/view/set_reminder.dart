import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/screen/reminder/controller/reminder_controller.dart';
import 'package:improvescap/utils/colors.dart';

class SetReminder extends StatelessWidget {
  var reminderController = Get.put(ReminderController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back_ios)),
        title: Text("Reminder",
          style: GoogleFonts.outfit(
              color: AppColors.whitekColor,
              fontSize: 20,
              fontWeight: FontWeight.w500
          ),
        ),

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
          child: Column(
            children: [
              buildContainer(text: 'Dont forget to go for a run', img: ImageConstant.calender,context: context),
              buildContainer(text: 'Dont forget to do your daily journaling', img: ImageConstant.calender,context: context),
              buildContainer(text: 'Make sure you read a chapter', img: ImageConstant.calender,context: context),
              SizedBox(height: 20,),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.whitekColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(Icons.add,),
              ),

            ],
          ),
        ),
      ),
    );
  }

   buildContainer({required String text,required String img,required var context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff201E23),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(text,
                          style: GoogleFonts.outfit(
                              color: AppColors.whitekColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: (){
                            reminderController.selectDate(context);
                          },
                          child: Image.asset(img,height: 30,))
                    ],
                  ),
                ),
              ),
    );
  }
}
