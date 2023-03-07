import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/utils/colors.dart';

import 'improvscap_prumum.dart';


class ImprovScapPrumuim_2 extends StatefulWidget {
  const ImprovScapPrumuim_2({Key? key}) : super(key: key);
  @override
  State<ImprovScapPrumuim_2> createState() => _ImprovScapPrumuim_2State();
}

class _ImprovScapPrumuim_2State extends State<ImprovScapPrumuim_2> {

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
                          Get.to(()=>ImprovScapPrumuim());
                        },
                        child: Icon(Icons.arrow_back_ios,color: AppColors.whitekColor,)),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(ImageConstant.impro,
                        height: 55,
                        width: MediaQuery.of(context).size.width-60,fit: BoxFit.fill,),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageConstant.diamondi,height: 30,),
                    Image.asset("assets/setting_image/Premium.png",width: 150,),
                    Image.asset(ImageConstant.diamondi,height: 30,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25,vertical: 20),
                child: Container(
                  height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff201E23),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          [
                            InkWell(
                              onTap: (){
                                Get.to(()=>ImprovScapPrumuim());
                              },
                              child: Text("Premium",

                                style: GoogleFonts.outfit(
                                    color: AppColors.whitekColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline
                                ),

                              ),
                            ),
                            Container(
                                width: 2,
                                height: 15,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: VerticalDivider(thickness: 1,color: Colors.white,)),
                            InkWell(
                              onTap: (){
                                Get.to(()=>ImprovScapPrumuim_2());
                              },
                              child: Text("VIOS",

                                style: GoogleFonts.outfit(
                                    color: AppColors.cPrimaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline
                                ),

                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 150.0),
                          child: Center(
                            child: Text("FULL SELF IMPROVEMENT COURSE COMING SOON!!!",
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
