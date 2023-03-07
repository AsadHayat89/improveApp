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
import 'package:improvescap/GetStorage/get_storage_controller.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/screen/add_logo/controller/add_logo_controller.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';
import 'package:improvescap/screen/make_chate/view/make_chate_screen.dart';
import 'package:improvescap/utils/colors.dart';

import '../../../reusable_widgets/bottom_navigation_bar.dart';
import '../../home/component/home_screen_component.dart';
import '../../home/controller/home_screen_controller.dart';

class DeleteLogo extends StatefulWidget {
  DeleteLogo({required this.caption,required this.image, this.logo_id,required this.gym,
    required this.skill,required this.readd, this.userId});
  final caption;
  final image;
  final logo_id;
  final userId;
  final gym;
  final skill;
  final readd;

  @override
  State<DeleteLogo> createState() => _DeleteLogoState();
}

class _DeleteLogoState extends State<DeleteLogo> {
  var homeController = Get.put(HomeScreenController());

  var captionEdtController = TextEditingController( );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      captionEdtController.text = widget.caption;
    });
  }

  @override
  Widget build(BuildContext context) {
    log("logo id "+ widget.logo_id);
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
              InkWell(
                onTap: () {
                  // Get.find<DeleteLogodetailesController>().getImage(ImageSource.gallery);

                },
                child: Stack(
                  children: [
                    // Get.put(DeleteLogodetailesController())
                    //     .selectedImagePath
                    //     .value ==
                    //     ""
                    //     ?
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Container(
                        width:270,
                        height: 270,
                        decoration: BoxDecoration(
                          color: Color(0xff19D083),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.network(widget.image,fit: BoxFit.fill,),
                      ),
                    )
                    //     : Container(
                    //   height: 250,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xff19D083),
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Image.file(
                    //     File(Get.find<DeleteLogodetailesController>().selectedImagePath.value,),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                  ],
                ),
              ),

                // Container(
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Color(0xff19D083),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: Image.asset(ImageConstant.camer,),
                // ),
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
                      controller: captionEdtController,
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
                HomeScreenComponent().buildContainer(text: 'Go to the gym',
                    color:widget.gym == "1" ? AppColors.cPrimaryColor: Color(0xff201E23), onTap: (){
                      //  homeController.selectCon1.value =! homeController.selectCon1.value;
                    }
                ),
                SizedBox(height: 9,),
                HomeScreenComponent().buildContainer(text: 'Read a book',
                    color:widget.readd == "1" ? AppColors.cPrimaryColor: Color(0xff201E23), onTap: (){
                      // homeController.selectCon2.value =! homeController.selectCon2.value;
                    }
                ),
                SizedBox(height: 9,),
                HomeScreenComponent().buildContainer(text: 'Learn a new skill',
                    color:widget.skill == "1" ? AppColors.cPrimaryColor: Color(0xff201E23), onTap: (){
                      //   homeController.selectCon3.value =! homeController.selectCon3.value;
                    }
                ),
                SizedBox(height: 40,),
              Get.find<GetSTorageController>().getloginModel()!.data!.id.toString() == widget.userId ?
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() =>  homeController.isLoading.value ? Center(child: CircularProgressIndicator(),) :
                    InkWell(
                      onTap: (){
                        homeController.deleteLogo(logo_id: widget.logo_id.toString());
                      },
                      child: Container(
                        // height: 50,
                        // width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red
                        ),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 13),
                          child: Center(
                            child: Text("Delete Log",style: GoogleFonts.outfit(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.whitekColor
                            ),),
                          ),
                        ),
                      ),
                    )

                      ,)

                  ],
                ),
              ):SizedBox.shrink(),
                SizedBox(height: 16,),
              ],
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
