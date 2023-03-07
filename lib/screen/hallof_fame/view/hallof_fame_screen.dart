import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/reusable_widgets/custome_button.dart';
import 'package:improvescap/screen/auth/login_screen/view/login_screen.dart';
import 'package:improvescap/utils/colors.dart';

import '../../improv_scap_prumium/view/improvscap_prumum.dart';


class HallofFame extends StatefulWidget {
  const HallofFame({Key? key}) : super(key: key);
  @override
  State<HallofFame> createState() => _HallofFameState();
}

class _HallofFameState extends State<HallofFame> {

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
                    Container(
                      height: 120,
                      // margin: EdgeInsets.only(right: 30),
                      // padding: EdgeInsets.only(left: 50),
                      // alignment: Alignment.center,
                      width:MediaQuery.of(context).size.width * 1 -70,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),bottomRight: Radius.circular(40)
                        )
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("IMPROVESCAPE",style: GoogleFonts.adventPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            color: Colors.white
                          ),),
                          Text("HALL OF FAME",style: GoogleFonts.adventPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            color: Colors.white
                          ),),
                        ],
                      ) ,
                    ),
                    // Image.asset(ImageConstant.hall,
                    //   width: MediaQuery.of(context).size.width -50,fit: BoxFit.fill,),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  // Get.to(()=>ImprovScapPrumuim());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                  child: Container(
                    height: 42,
                    width: double.infinity,
                    color: Color(0xffD9D9D9),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("1. DYLAN OBRIEN",style: GoogleFonts.adventPro(
                              color: AppColors.blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(left: 38.0),
                            child: Text("FATHER DELT",style: GoogleFonts.adventPro(
                                color: AppColors.blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              buildContainer(text: '2. BRYCE FULTZ'),
              buildContainer(text: '3. COMING SOON'),
              buildContainer(text: '4. COMING SOON'),
              buildContainer(text: '5. COMING SOON'),
              buildContainer(text: '6. COMING SOON'),
              buildContainer(text: '7. COMING SOON'),
              buildContainer(text: '8. COMING SOON'),






            ],
          ),
        ),
      ),
    );
  }

   buildContainer({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 15),
      child:
      Container(
                  height: 40,
                  width: double.infinity,
                  color: Color(0xffD9D9D9),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 30),
                      child: Text(text,style: GoogleFonts.adventPro(
                          color: AppColors.blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                ),
    );
  }

}
