import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/reusable_widgets/custome_button.dart';
import 'package:improvescap/screen/auth/login_screen/view/login_screen.dart';
import 'package:improvescap/screen/chat/view/chat_view.dart';
import 'package:improvescap/screen/home/screens/daily_goals/controller/daily_screen_controller.dart';
import 'package:improvescap/utils/colors.dart';

import '../../../models/daily_goals_model.dart';
import 'join_chat.dart';


class MakeAchat extends StatefulWidget {
  const MakeAchat({Key? key}) : super(key: key);
  @override
  State<MakeAchat> createState() => _MakeAchatState();
}

class _MakeAchatState extends State<MakeAchat> {

  bool stat1 = false;
  bool stat2 = false;

  List<String> memberList = ['1','2', '3', '5','6','7','8','9','10',];
 // String? selectMember;

  var searchController = Get.put(SearchChatController());
  @override
  void initState() {
    super.initState();
    searchController.memberAmount = memberList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios,)),
        title: Text("Enter Name",style: GoogleFonts.outfit(
            color: AppColors.greylight,
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: searchController.formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Obx(() =>  Stack(
                   children: [
                     searchController.selectedImagePath.value == ""?
                     CircleAvatar(
                       radius: 60,
                       backgroundImage: AssetImage(ImageConstant.add_phpt
                         // Get.find<GetSTorageController>().getloginModel()!.data!.userInfo!.profilePicture.toString(),
                       ),
                     ): CircleAvatar(
                       radius: 60,
                       backgroundImage: FileImage(
                         File(searchController.selectedImagePath.value,),
                       ),
                     ),
                     Positioned(
                       bottom: -7,
                       left: 70,
                       child: IconButton(
                         onPressed: () {
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
                                 if (searchController.isLoading.value) {
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
                                       searchController
                                           .getImage(ImageSource.gallery);
                                       Get.back();
                                     },
                                     child: Text(
                                       "Gallery",
                                       style: TextStyle(color: Colors.white),
                                     ));
                               }),
                               Obx(() {
                                 if (searchController.isLoading.value) {
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
                                       searchController
                                           .getImage(ImageSource.camera);
                                       Get.back();
                                     },
                                     child: Text("Camera"));
                               }),
                             ],
                           );
                         },
                         // onPressed: selectImage,
                         icon: Container(
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(100)
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(4),
                             child: Icon(Icons.edit_outlined,color: AppColors.cPrimaryColor,),
                           ),
                         ),
                       ),
                     )
                   ],
                 ),),
                  Text("Add a Photo",style: GoogleFonts.outfit(
                      color: AppColors.whitekColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                  ),),
                  SizedBox(height: 50,),


                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      //height: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff201E23),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                            child: Row(
                              children: [
                                Text("Group Name:",
                                  style: GoogleFonts.outfit(
                                      color: AppColors.whitekColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    controller: searchController.nameController,
                                    style:GoogleFonts.outfit(
                                        color: AppColors.greylight,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400
                                    ) ,
                                    decoration: InputDecoration(
                                      hintText: "Enter here",
                                      hintStyle: GoogleFonts.outfit(
                                          color: AppColors.greylight,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400
                                      ),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                // Text(" Enter here",
                                //   style: GoogleFonts.outfit(
                                //       color: AppColors.greylight,
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w400
                                //   ),
                                // ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25,),
                            child: Row(
                              children: [
                                Text("Description of chat:",
                                  style: GoogleFonts.outfit(
                                      color: AppColors.whitekColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    controller: searchController.descriptionTextController,
                                    style:GoogleFonts.outfit(
                                        color: AppColors.greylight,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400
                                    ) ,
                                    decoration: InputDecoration(
                                        hintText: "Enter here",
                                        hintStyle: GoogleFonts.outfit(
                                            color: AppColors.greylight,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400
                                        ),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                // Text(" Enter here",
                                //   style: GoogleFonts.outfit(
                                //       color: AppColors.greylight,
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w400
                                //   ),
                                // ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                            child: Row(
                              children: [
                                Text("Member Amount: ",
                                  style: GoogleFonts.outfit(
                                      color: AppColors.whitekColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                 // height: 10,
                                  width: 60,
                                 // margin: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.transparent,
                                  ),
                                  padding: const EdgeInsets.only(left: 15,right: 10,),
                                  child: PopupMenuButton<String>(
                                    itemBuilder: (context) {
                                      return memberList.map((str) {
                                        return PopupMenuItem(
                                          value: str,
                                          child: Text(str,style: GoogleFonts.outfit(
                                              color: AppColors.greylight,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400
                                          ),),
                                        );
                                      }).toList();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[

                                        Text("1  -",style: GoogleFonts.outfit(
                                            color: AppColors.greylight,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400
                                        ),),
                                        Text(searchController.memberAmount!,style: GoogleFonts.outfit(
                                            color: AppColors.greylight,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400
                                        ),),
                                      ],
                                    ),
                                    onSelected: (v) {
                                      setState(() {
                                        print('!!!===== $v');
                                        searchController.memberAmount = v;
                                        log("memberAmount of "+   searchController.memberAmount.toString());
                                     //   classs = v;
                                      });
                                    },
                                  ),
                                ),
                                // Text("2-10",
                                //   style: GoogleFonts.outfit(
                                //       color: AppColors.greylight,
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w400
                                //   ),
                                // ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.
                      symmetric(horizontal: 20),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xff201E23),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildReminderContainer(text: 'Private group',
                              status: stat1, ontogal: (val) {
                                setState(() {
                                  stat1 = val;
                                  if(stat1 == false){
                                    searchController.privateVlaue = "0";
                                    log("value of "+  searchController.privateVlaue.toString());
                                  }
                                  else{
                                    searchController.privateVlaue = "1";
                                    log("value of "+  searchController.privateVlaue.toString());
                                  }
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Group password",
                                    style: GoogleFonts.outfit(
                                        color: AppColors.whitekColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: TextFormField(
                                      controller: searchController.gPasswordController,
                                      style:GoogleFonts.outfit(
                                          color: AppColors.greylight,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400
                                      ) ,
                                      decoration: InputDecoration(
                                          hintText: "Enter here",
                                          hintStyle: GoogleFonts.outfit(
                                              color: AppColors.greylight,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400
                                          ),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Group link",
                                    style: GoogleFonts.outfit(
                                        color: AppColors.whitekColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Icon(Icons.copy,color: AppColors.whitekColor,)
                                ],
                              ),
                            ),





                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),





                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:
     Obx(() => searchController.isLoading.value? Container(
         height: 40,
         child: Center(child: CircularProgressIndicator(),)) :Padding(
       padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
       child: InkWell(
         onTap: (){
           searchController.addgroupChatbutton();
           // Get.to(()=>ChatScreen(categoriesModel: catogriies[0] ));
         },
         child: Container(
           height: 40,
           decoration: BoxDecoration(
               color: AppColors.cPrimaryColor,
               borderRadius: BorderRadius.circular(20)
           ),
           child: Center(
             child: Text("Make Chat",
               style: GoogleFonts.outfit(
                   color: AppColors.whitekColor,
                   fontSize: 18,
                   fontWeight: FontWeight.w800
               ),
             ),
           ),
         ),
       ),
     ),)
         );
  }

  Padding buildReminderContainer({required String text,var ontogal,bool status = false,}) {
    return
      Padding(
        padding: const EdgeInsets.all(8),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Image.asset(img,height: 20),
                SizedBox(
                  width: 10,
                ),
                Text(text,
                  style: GoogleFonts.outfit(
                      color: AppColors.whitekColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),

            FlutterSwitch(
              inactiveColor:Colors.red,
              activeColor:  AppColors.cPrimaryColor,
              width: 40.0,
              height: 25.0,
              toggleSize: 17,
              value: status,
              onToggle: ontogal,
            ),
          ],
        ),
      );
  }
}
