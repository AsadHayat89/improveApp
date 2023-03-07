import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/screen/add_logo/controller/add_logo_controller.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';
import 'package:improvescap/screen/make_chate/view/make_chate_screen.dart';
import 'package:improvescap/utils/colors.dart';

import '../../../reusable_widgets/bottom_navigation_bar.dart';
import '../../home/component/home_screen_component.dart';
import '../../home/controller/home_screen_controller.dart';

class AddLogo extends StatelessWidget {
   AddLogo({Key? key}) : super(key: key);
  var homeController = Get.put(HomeScreenController());
   final addLogoController = Get.put(AddLogodetailesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Text("Add a Log",style: GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.w800
        ),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:35),
            child: Form(
              key: addLogoController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Add a Photo",style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    color: AppColors.whitekColor
                  ),),
                  SizedBox(
                    height: 5,
                  ),
                  Obx(() => InkWell(
                      onTap: () {
                      Get.find<AddLogodetailesController>().getImage(ImageSource.gallery);

                    },
                    child: Stack(
                      children: [
                        Get.put(AddLogodetailesController())
                            .selectedImagePath
                            .value ==
                            ""
                            ? Padding(
                          padding: const EdgeInsets.symmetric(),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff19D083),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(ImageConstant.camer,),
                          ),
                        ) : Container(
                          height: 270,
                              width: 270,
                              decoration: BoxDecoration(
                                color: Color(0xff19D083),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.file(
                                  File(Get.find<AddLogodetailesController>().selectedImagePath.value,),
                                fit: BoxFit.fill,
                              ),
                            ),
                      ],
                    ),
                  )),

                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff444345),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: addLogoController.descriptionTextController,
                        validator: validateName,
                        style: TextStyle(
                          color: AppColors.whitekColor,
                        ),
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter A Caption",
                          hintStyle: TextStyle(
                            color: AppColors.whitekColor,
                          )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Goal completed",style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whitekColor
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(()=> HomeScreenComponent().buildContainer(text: 'Go to the gym',
                      color:homeController.selectCon1.value ? AppColors.cPrimaryColor: Color(0xff201E23), onTap: (){
                       // homeController.selectCon1.value =! homeController.selectCon1.value;
                        homeController.selectCon2.value = false;
                        homeController.selectCon1.value = true;
                        homeController.selectCon3.value = false;
                        if(homeController.selectCon1.value == true)
                        {
                          addLogoController.gym.value = 1;
                          addLogoController.skill.value = 0;
                          addLogoController.read.value = 0;
                          log("read value " +  addLogoController.read.value.toString());
                          log("gym value " +  addLogoController.gym.value.toString());
                          log("skill value " +  addLogoController.skill.value.toString());
                        }
                      }
                  ),),
                  SizedBox(height: 9,),
                  Obx(()=> HomeScreenComponent().buildContainer(text: 'Read a book',
                      color:homeController.selectCon2.value ? AppColors.cPrimaryColor: Color(0xff201E23), onTap: (){
                       // homeController.selectCon2.value =! homeController.selectCon2.value;
                        homeController.selectCon2.value = true;
                        homeController.selectCon1.value = false;
                        homeController.selectCon3.value = false;
                        if(homeController.selectCon2.value == true)
                        {
                          addLogoController.gym.value = 0;
                          addLogoController.skill.value = 0;
                          addLogoController.read.value = 1;
                          log("read value " +  addLogoController.read.value.toString());
                          log("gym value " +  addLogoController.gym.value.toString());
                          log("skill value " +  addLogoController.skill.value.toString());
                        }
                      }
                  ),),
                  SizedBox(height: 9,),
                  Obx(()=> HomeScreenComponent().buildContainer(text: 'Learn a new skill',
                      color:homeController.selectCon3.value ? AppColors.cPrimaryColor: Color(0xff201E23),
                      onTap: (){
                       // homeController.selectCon3.value =! homeController.selectCon3.value;
                        homeController.selectCon2.value = false;
                        homeController.selectCon1.value = false;
                        homeController.selectCon3.value = true;
                        if(homeController.selectCon3.value == true)
                        {
                          addLogoController.gym.value = 0;
                          addLogoController.skill.value = 1;
                          addLogoController.read.value = 0;
                          log("read value " +  addLogoController.read.value.toString());
                          log("gym value " +  addLogoController.gym.value.toString());
                          log("skill value " +  addLogoController.skill.value.toString());
                        }
                      }
                  ),),
                  SizedBox(height: 40,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                       Obx(() => addLogoController.isLoading.value ? Center(child: CircularProgressIndicator(),): InkWell(
                         onTap: (){
                           addLogoController.addLogobutton();
                          // Get.to(()=>HomeScreen(),transition: Transition.leftToRight,duration: Duration(milliseconds: 500));
                         },

                         child:
                         Container(
                           // height: 50,
                           // width: 120,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               color: AppColors.cPrimaryColor
                           ),
                           child:Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 13),
                             child: Center(
                               child: Text("Add Log",style: GoogleFonts.outfit(
                                   fontSize: 20,
                                   fontWeight: FontWeight.w700,
                                   color: AppColors.whitekColor
                               ),),
                             ),
                           ),
                         ),
                       ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:CustomBottomNavBar(index: 1),
    );
  }
   String? validateName(String? value) {
     if (value!.length < 3)
       return 'Name must be more than 2 charater';
     else
       return null;
   }
}
