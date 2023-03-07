import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/reusable_widgets/custome_button.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';
import 'package:improvescap/screen/profile/controller/profile_controller.dart';
import 'package:improvescap/utils/colors.dart';
import 'package:intl/intl.dart';
import '../../../GetStorage/get_storage_controller.dart';
import '../../../utils/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  var profileController = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();

    //profileController.countryController.text =
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.to(() => HomeScreen());
            },
            child: Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Center(
            child: Form(
              key: profileController.profileFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               Obx(() =>    Stack(
                 children: [
                   profileController.selectedImagePath.value != ""? CircleAvatar(
                       radius: 60,
                       backgroundImage: FileImage(File(profileController.selectedImagePath.value),
                       ) )
                       :
                   Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(200),
                         border:
                         Border.all(width: 1, color: Colors.white)),
                     child: CircleAvatar(
                       radius: 60,
                       backgroundImage: NetworkImage(
                           Get.find<GetSTorageController>().getloginModel()!.data!.image.toString()),
                     ),
                   ),
                   Positioned(
                     bottom: -7,
                     left: 70,
                     child: IconButton(
                       onPressed: (){
                         Get.defaultDialog(
                           title: "Image Picker",
                           titleStyle: TextStyle(
                             fontSize: 18,
                           ),
                           middleText: "Select Image From Gallery",
                           middleTextStyle: TextStyle(
                             fontSize: 14,
                           ),
                           radius: 5,
                           actions: [
                             Obx(() {
                               if (profileController.isLoading.value) {
                                 return Center(
                                   child: CircularProgressIndicator(
                                     color: Colors.blue,
                                   ),
                                 );
                               }
                               return ElevatedButton(
                                   style: ButtonStyle(
                                       backgroundColor:
                                       MaterialStateProperty.all(
                                           Colors.blue
                                       )),
                                   onPressed: () {
                                     profileController
                                         .getImage(ImageSource.gallery);
                                     Get.back();
                                   },
                                   child: Text(
                                     "Gallery",
                                     style: TextStyle(color: Colors.white),
                                   ));
                             }),
                             Obx(() {
                               if (profileController.isLoading.value) {
                                 return Center(
                                   child: CircularProgressIndicator(
                                     color: Colors.blue,
                                   ),
                                 );
                               }
                               return ElevatedButton(
                                   style: ButtonStyle(
                                       backgroundColor:
                                       MaterialStateProperty.all(
                                           Colors.blue)),
                                   onPressed: () {
                                     profileController
                                         .getImage(ImageSource.camera);
                                     Get.back();
                                   },
                                   child: Text("Camera"));
                             }),
                           ],
                         );
                       },
                       icon: Container(
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(100)),
                         child: Padding(
                           padding: const EdgeInsets.all(4),
                           child: Icon(
                             Icons.edit_outlined,
                             color: AppColors.cPrimaryColor,
                           ),
                         ),
                       ),
                     ),
                   )
                 ],
               ),),
                  Text(
                    "Edit image",
                    style: GoogleFonts.outfit(
                        color: AppColors.whitekColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  buildPadding(
                      controller: profileController.userNameController,
                      img: ImageConstant.profile_s,
                      text: 'User name'),
                  buildPadding(
                      controller: profileController.emailController,
                      img: ImageConstant.sms,
                      text: 'Email'),
                  buildPadding(
                      ontap: () async {

                      },
                      controller: profileController.dateOfBirthController,
                      img: ImageConstant.calender,
                      text: 'Date of birth'),

                  buildPadding(
                      controller: profileController.countryController,
                      img: ImageConstant.global,
                      text: 'Country'),
                  // Padding(
                  //   padding:
                  //   const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  //   child: Container(
                  //       height: 60,
                  //       width: double.infinity,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: Color(0xff201E23)),
                  //       child: TextFormField(
                  //         style: GoogleFonts.outfit(
                  //             color: AppColors.whitekColor,
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w500),
                  //         onTap: (){
                  //           Theme(
                  //             data: ThemeData.light().copyWith(
                  //                 colorScheme: ColorScheme.light(
                  //                     primary: Colors.white)),
                  //             child: CountryListPick(
                  //                 theme: CountryTheme(
                  //                   labelColor: Colors.white,
                  //                   alphabetSelectedBackgroundColor: Colors.white,
                  //                   alphabetSelectedTextColor: Colors.white,
                  //                   alphabetTextColor: Colors.white,
                  //                   isShowFlag: false,
                  //                   isShowTitle: true,
                  //                   isShowCode: false,
                  //                   isDownIcon: false,
                  //                   showEnglishName: true,
                  //                 ),
                  //                 // initialSelection: '',
                  //                 onChanged: (CountryCode? code) {
                  //                   print(code!.name);
                  //                   print(code.code);
                  //                   print(code.dialCode);
                  //                   print(code.flagUri);
                  //                 },
                  //                 useUiOverlay: false,
                  //                 useSafeArea: false),
                  //           );
                  //         },
                  //         controller: profileControler.countryController,
                  //         decoration: InputDecoration(
                  //             border: InputBorder.none,
                  //             prefixIcon:Padding(
                  //               padding: const EdgeInsets.all(5),
                  //               child: Image.asset(ImageConstant.global,height: 20,),
                  //             )
                  //
                  //         ),
                  //       )
                  //
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      Get.find<GetSTorageController>().removeStorage();
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff201E23)),
                        child: ListTile(
                          title: Text(
                            "LOG OUT",
                            style: GoogleFonts.outfit(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:
     Obx(() => profileController.isLoading.value? Container(
         height: 60,
         child: Center(child: CircularProgressIndicator(),)): CustomButton(
         buttonFunction: () {
           profileController.profileUpdatebutton();
         },
         textString: "SAVE",
         buttonColor: AppColors.cPrimaryColor,
         buttonHeight: 60,
         buttonWidth: MediaQuery.of(context).size.width,
         textColor: AppColors.whitekColor,
         textSize: 20,
         textWeight: FontWeight.w700),)
    );
  }
  Padding buildPadding(
      {var img, required String text, var controller, var ontap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xff201E23)),
        child: TextFormField(
          onTap: ontap,
          controller: controller,
          style: GoogleFonts.outfit(
              color: AppColors.whitekColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12, top: 15, right: 10),
                child: Image.asset(
                  img,
                  height: 20,
                ),
              ),
              hintText: text,
              hintStyle: GoogleFonts.outfit(
                  color: AppColors.whitekColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 12, top: 22)),
        ),
      ),
    );
  }
}
