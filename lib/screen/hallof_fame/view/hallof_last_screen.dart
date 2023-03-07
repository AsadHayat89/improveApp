import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/utils/colors.dart';


class ImprovScapPrumuimLast extends StatefulWidget {
  const ImprovScapPrumuimLast({Key? key}) : super(key: key);
  @override
  State<ImprovScapPrumuimLast> createState() => _ImprovScapPrumuimLastState();
}

class _ImprovScapPrumuimLastState extends State<ImprovScapPrumuimLast> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios,color: AppColors.whitekColor,)),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(ImageConstant.logoImage,
                        width: MediaQuery.of(context).size.width-52,fit: BoxFit.fill,),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/setting_image/Premium.png",width: 150,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40,vertical: 20),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff201E23),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Text("Premium  |   VIOS ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            color: AppColors.whitekColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),),

                        Padding(
                          padding: const EdgeInsets.only(top: 90.0),
                          child: Center(
                            child: Text("FULL SELF IMPROVEMENT COURDSE COMING SOON!!!",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lexend(
                                color: AppColors.whitekColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }


}
