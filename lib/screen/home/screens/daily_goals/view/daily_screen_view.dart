import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/screen/chat/view/chat_view.dart';
import 'package:improvescap/screen/home/screens/daily_goals/controller/daily_screen_controller.dart';

import '../../../../../GetStorage/get_storage_controller.dart';
import '../../../../../generated/assert.dart';
import '../../../../../models/daily_goals_model.dart';
import '../../../../../reusable_widgets/bottom_navigation_bar.dart';
import '../../../../../reusable_widgets/custom_textfield.dart';
import '../../../../../reusable_widgets/custtom_app_bar.dart';
import '../../../../../utils/colors.dart';
import '../../../../make_chate/view/join_chat.dart';
import '../../../../make_chate/view/make_chate_screen.dart';
import '../../../../profile/controller/profile_controller.dart';
import '../../../../profile/view/profile_screen.dart';
class DailyGoals extends StatefulWidget {
  const DailyGoals({Key? key}) : super(key: key);

  @override
  State<DailyGoals> createState() => _DailyGoalsState();
}

class _DailyGoalsState extends State<DailyGoals> {

  final searchChatController = Get.put(SearchChatController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchChatController.showAllLogoData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar:    AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Text("Search",style: GoogleFonts.outfit(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.whitekColor,
        ),),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
          //   child: InkWell(
          //       onTap: (){
          //         Get.to(()=>ProfileScreen());
          //       },
          //       child:  CircleAvatar(
          //           backgroundImage: NetworkImage(profileControler.imageController.text.toString()))),
          // )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                     child: CustomeTextfield(
                       prefixIcon: Icon(Icons.search,color: AppColors.whitekColor,size: 30,),
                     ),
                   ),
                   Obx(() {
                     if (searchChatController.isLoading.value) {
                       return Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                     if (searchChatController
                         .model.value.data!.length==0) {
                       log("empty");
                       return Center(
                         child: Padding(
                           padding: const EdgeInsets.only(top: 180),
                           child: Text(
                               "No Order Found",
                               style: TextStyle(
                                   fontSize: 14,
                                   color: Colors.white)),
                         ),
                       );
                     }
                     if (searchChatController
                         .isEmpty.value) {
                       log("empty");
                       return Center(
                         child: Text(
                             "No Order Found",
                             style: TextStyle(
                                 fontSize: 14,
                                 color: Colors.white)),
                       );
                     }

                     return   ListView.builder(
                           shrinkWrap: true,
                           physics: ClampingScrollPhysics(),
                           scrollDirection: Axis.vertical,
                         itemCount:searchChatController
                             .model.value.data!.length,
                         itemBuilder: (context, index) {
                           var items =
                           searchChatController.model.value.data![index];
                           return
                             InkWell(

                               onTap:(){
                               //  Get.to(()=>ChatScreen(itemIndex: items));
                               if(items.private == "1")
                               {
                                 showDialog(context: context, builder: (context){
                                   return
                                     AlertDialog(
                                       title: Column(
                                         children: [
                                           Text("Join chat",
                                             style: TextStyle(
                                               fontSize: 22,
                                             ),
                                           ),

                                           SizedBox(
                                             height: 20,
                                           ),
                                         ],
                                       ),
                                       actions: [
                                         Padding(
                                           padding: const EdgeInsets.symmetric(horizontal: 20),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               TextButton(onPressed: (){
                                                 Get.back();
                                               },
                                                   child: Text("No",
                                                     style: TextStyle(
                                                         color: Colors.grey
                                                     ),
                                                   )),
                                               TextButton(onPressed: (){
                                                 Get.to(()=>JoinChat(indexx: items,));
                                               },
                                                   child: Text("yes"))
                                             ],
                                           ),
                                         ),
                                       ],
                                     );
                                 });
                               }
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
                         });
                   }),
                   // ListView.builder(
                   //     shrinkWrap: true,
                   //     physics: ClampingScrollPhysics(),
                   //     scrollDirection: Axis.vertical,
                   //     itemCount: 8,
                   //     itemBuilder: (context, index) {
                   //       return
                   //         InkWell(
                   //
                   //           onTap:(){
                   //             showDialog(context: context, builder: (context){
                   //               return
                   //                 AlertDialog(
                   //                   title: Column(
                   //                     children: [
                   //                       Text("Join chat",
                   //                         style: TextStyle(
                   //                           fontSize: 22,
                   //                         ),
                   //                       ),
                   //
                   //                       SizedBox(
                   //                         height: 20,
                   //                       ),
                   //                     ],
                   //                   ),
                   //                   actions: [
                   //                     Padding(
                   //                       padding: const EdgeInsets.symmetric(horizontal: 20),
                   //                       child: Row(
                   //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //                         children: [
                   //                           TextButton(onPressed: (){
                   //                             Get.back();
                   //                           },
                   //                               child: Text("No",
                   //                                 style: TextStyle(
                   //                                     color: Colors.grey
                   //                                 ),
                   //                               )),
                   //                           TextButton(onPressed: (){
                   //                             Get.to(()=>ChatScreen(categoriesModel: catogriies[index]));
                   //                           },
                   //                               child: Text("yes"))
                   //                         ],
                   //                       ),
                   //                     ),
                   //                   ],
                   //                 );
                   //             });
                   //           },
                   //           // onTap: (){
                   //           //   Get.to(()=>ChatScreen(categoriesModel: catogriies[index]));
                   //           // },
                   //           child: ListTile(
                   //             leading: CircleAvatar(
                   //               backgroundImage: AssetImage(catogriies[index].image),
                   //             ),
                   //             title: Text(catogriies[index].name_title,style: GoogleFonts.outfit(
                   //                 fontWeight: FontWeight.w500,
                   //                 fontSize: 15,
                   //               color: AppColors.whitekColor
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


                 ],
              ),
            ),

        Align(alignment: Alignment.bottomCenter,child:   Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    //Get.to(()=>ChatScreen(categoriesModel: catogriies[0]));
                    Get.to(()=>MakeAchat());
                  },
                  child: Container(
                    // height: 50,
                    // width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.cPrimaryColor,
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 13),
                      child: Center(
                        child: Text("Make A chat",style: GoogleFonts.outfit(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.whitekColor
                        ),),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // InkWell(
                //   onTap: (){
                //     // Get.to(()=>MakeAchat());
                //     Get.to(()=>JoinChat());
                //   },
                //
                //   child: Container(
                //     // height: 50,
                //     // width: 120,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30),
                //         color: AppColors.greylight
                //     ),
                //     child:Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 13),
                //       child: Center(
                //         child: Text("Join a chat",style: GoogleFonts.outfit(
                //             fontSize: 20,
                //             fontWeight: FontWeight.w700,
                //             color: AppColors.whitekColor
                //         ),),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(ImageConstant.bottom,width: double.infinity,fit: BoxFit.fill,)
        ],),)
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(index: 0,),
    );
  }
}
