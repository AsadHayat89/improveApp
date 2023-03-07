import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/reusable_widgets/custome_button.dart';
import 'package:improvescap/screen/auth/login_screen/view/login_screen.dart';
import 'package:improvescap/screen/chat_list/controller/group_chat_controller.dart';
import 'package:improvescap/screen/hallof_fame/view/hallof_fame_screen.dart';
import 'package:improvescap/utils/colors.dart';


class JoinChat extends StatefulWidget {
  const JoinChat({required this.indexx}) ;

  final indexx;
  @override
  State<JoinChat> createState() => _JoinChatState();
}

class _JoinChatState extends State<JoinChat> {
  bool stat1 = false;
  bool stat2 = false;
  List<String> memberList = ['1','2', '3', '5','6','7','8','9','10',];
  String? selectMember;
  @override
  void initState() {
    super.initState();
    selectMember = memberList[0];
  }

  var joinGroupController = Get.put(GroupChatController());

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
            child: Icon(Icons.arrow_back_ios,)),
        title: Text("Join Chat",style: GoogleFonts.outfit(
            color: AppColors.whitekColor,
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
        ),
        child: Center(
          child: Form(
            key: joinGroupController.joinFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    //height: 104,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff201E23),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25,),
                            child: Row(
                              children: [
                                Text("Enter Chat Name:",
                                  style: GoogleFonts.outfit(
                                      color: AppColors.whitekColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    controller: joinGroupController.nameJoinController,
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
                            child:
                            Row(
                              children: [
                                Text("Group Password:",
                                  style: GoogleFonts.outfit(
                                      color: AppColors.whitekColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    controller: joinGroupController.passwordJoinController,
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
                        ],
                      ),
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
                    height: 164,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xf737373),
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
                              });
                            },
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 15,),
                          //   child:
                          //   Row(
                          //     children: [
                          //       Text("Group password:",
                          //         style: GoogleFonts.outfit(
                          //             color: AppColors.whitekColor,
                          //             fontSize: 18,
                          //             fontWeight: FontWeight.w700
                          //         ),
                          //       ),
                          //       SizedBox(width: 5,),
                          //       Expanded(
                          //         child: TextFormField(
                          //           style:GoogleFonts.outfit(
                          //               color: AppColors.greylight,
                          //               fontSize: 15,
                          //               fontWeight: FontWeight.w400
                          //           ) ,
                          //           decoration: InputDecoration(
                          //               hintText: "Enter here",
                          //               hintStyle: GoogleFonts.outfit(
                          //                   color: AppColors.greylight,
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.w400
                          //               ),
                          //               border: InputBorder.none
                          //           ),
                          //         ),
                          //       ),
                          //       // Text(" Enter here",
                          //       //   style: GoogleFonts.outfit(
                          //       //       color: AppColors.greylight,
                          //       //       fontSize: 15,
                          //       //       fontWeight: FontWeight.w400
                          //       //   ),
                          //       // ),
                          //
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child:
                            Row(
                              children: [
                                Text("Enter Group link:",
                                  style: GoogleFonts.outfit(
                                      color: AppColors.whitekColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    style:GoogleFonts.outfit(
                                        color: AppColors.greylight,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400
                                    ) ,
                                    decoration: InputDecoration(
                                        hintText: "(Optional)",
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
      bottomNavigationBar:
      Obx(() =>  joinGroupController.isLoading.value ? Center(child: Container(
          height: 30,
          width: 30,
          child: CircularProgressIndicator()),):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
        child: InkWell(
          onTap: (){
            if( joinGroupController.joinFormKey.currentState!.validate() || joinGroupController.nameJoinController.text != "" ){
              joinGroupController.joinGroup(
                  name: joinGroupController.nameJoinController.value.text,
                  password: joinGroupController.passwordJoinController.value.text
              );
            }
            // Get.to(()=>HallofFame());
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff707573),
                borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Text("Join Chat",
                style: GoogleFonts.outfit(
                    color: AppColors.whitekColor,
                    fontSize: 32,
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
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),

            FlutterSwitch(
              inactiveColor:Colors.red,
              activeColor: AppColors.cPrimaryColor,
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
