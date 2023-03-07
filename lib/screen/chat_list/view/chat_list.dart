import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/screen/chat/view/chat_view.dart';
import 'package:improvescap/screen/chat_list/controller/group_chat_controller.dart';

import '../../../../../generated/assert.dart';
import '../../../../../models/daily_goals_model.dart';
import '../../../../../reusable_widgets/bottom_navigation_bar.dart';
import '../../../../../reusable_widgets/custom_textfield.dart';
import '../../../../../reusable_widgets/custtom_app_bar.dart';
import '../../../../../utils/colors.dart';
import '../../../GetStorage/get_storage_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/view/profile_screen.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
 //   getCurrentUserData();
    groupChatController.groupChatData();
  }

  var profileControler = Get.put(ProfileController());
  final groupChatController = Get.put(GroupChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Text("My Chats",style: GoogleFonts.outfit(
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
                child: CircleAvatar(
                    backgroundImage: NetworkImage(Get.find<GetSTorageController>().getloginModel()!.data!.image.toString()))),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: ClampingScrollPhysics(),
                  //     scrollDirection: Axis.vertical,
                  //     itemCount: 14,
                  //     itemBuilder: (context, index) {
                  //       return
                  //         InkWell(
                  //           onTap: (){
                  //             Get.to(()=>ChatScreen(categoriesModel: catogriies[index]));
                  //           },
                  //           child: ListTile(
                  //             leading: CircleAvatar(
                  //               backgroundImage: AssetImage(catogriies[index].image),
                  //             ),
                  //             title: Text(catogriies[index].name_title,style: GoogleFonts.outfit(
                  //                 fontWeight: FontWeight.w500,
                  //                 fontSize: 15,
                  //                 color: AppColors.whitekColor
                  //
                  //             ),),
                  //             subtitle: Text("Group code ABCD",style: GoogleFonts.outfit(
                  //                 fontWeight: FontWeight.w400,
                  //                 fontSize: 16,
                  //                 color: AppColors.whitekColor
                  //             ),),
                  //             trailing: Text("2/10",style: GoogleFonts.outfit(
                  //                 fontWeight: FontWeight.w400,
                  //                 fontSize: 12,
                  //                 color: AppColors.greylight
                  //
                  //             ),),
                  //           ),
                  //         );
                  //     }),
                  Obx(() {
                    if (groupChatController.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (groupChatController
                        .model.value.success.toString() == "false") {
                      log("empty");
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 180),
                          child: Text(
                              "No Group joined yet",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white)),
                        ),
                      );
                    }
                    if (groupChatController
                        .isEmpty.value) {
                      log("empty");
                      return Center(
                        child: Text(
                            "No Group joined yet",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white)),
                      );
                    }

                    return groupChatController
                        .model.value.data!=null?
                      ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount:groupChatController
                            .model.value.data!.length,
                        itemBuilder: (context, index) {
                          var items =
                          groupChatController.model.value.data![index];
                          return
                            InkWell(

                              onTap:(){
                                Get.to(()=>ChatScreen(itemIndex: items));
                              },
                              // onTap: (){
                              //   Get.to(()=>ChatScreen(categoriesModel: catogriies[index]));
                              // },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(items.image.toString()),
                                ),
                                title: Text(items.name.toString(),style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.whitekColor

                                ),),
                                subtitle: Text(items.memberAmount.toString(),style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.whitekColor
                                ),),
                                trailing: Text("2/10",style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.greylight

                                ),),
                              ),
                            );
                        }):Center(
                      child: Text(
                          "No Group joined yet",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white)),
                    );
                  }),
                  SizedBox(
                    height: 40,
                  ),

                ],
              ),
            ),
           Align(alignment: Alignment.bottomCenter,child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Image.asset(ImageConstant.bottom,width: double.infinity,fit: BoxFit.fill,)
             ],
           ),)
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(index: 0,),
    );
  }
}
