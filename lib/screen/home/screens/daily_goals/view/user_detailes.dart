import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/models/user_detailes_model.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';

import '../../../../../generated/assert.dart';
import '../../../../../models/daily_goals_model.dart';
import '../../../../../models/leaderboard_model.dart';
import '../../../../../utils/colors.dart';
import '../../../../make_chate/view/make_chate_screen.dart';


class UserDetailes extends StatefulWidget {
  // final CategoriesModel categoriesModel;
  var image;
  var title;
  UserDetailes({Key? key,required this.image,required this.title}) : super(key: key);

  @override
  State<UserDetailes> createState() => _UserDetailesState();
}

class _UserDetailesState extends State<UserDetailes> {
  bool stat1 = false;
  bool stat2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.keyboard_arrow_left_rounded,size: 40,)),
            SizedBox(
              width: 10,
            ),

          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(widget.image,
                          // Get.find<GetSTorageController>().getloginModel()!.data!.userInfo!.profilePicture.toString(),
                        ),
                      ),
                      Positioned(
                        bottom: -7,
                        left: 70,
                        child: IconButton(
                          onPressed: () {
                            // Get.to(EditeProfileScreen());
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
                  ),
                  // CircleAvatar(
                  //   radius: 50,
                  //   backgroundImage: AssetImage(widget.image),),

                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.title,style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.whitekColor,
                  ),),
                  Text("10 members",style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: AppColors.cPrimaryColor,
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xf737373),
                    ),
                    child:     ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return
                            InkWell(
                              onTap: (){
                                //Get.to(()=>ChatScreen(categoriesModel: catogriies[index]));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(userdetailes[index].image),
                                ),
                                title: Text(userdetailes[index].name_title,style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: AppColors.whitekColor

                                ),),
                              ),
                            );
                        }),
                  ),
                  SizedBox(height: 20,),


                  Container(
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
                                Text("ABC*",
                                  style: GoogleFonts.outfit(
                                      color: AppColors.whitekColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Group link",
                                  style: GoogleFonts.outfit(
                                      color: AppColors.whitekColor,
                                      fontSize: 14,
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
                  SizedBox(height: 24,),
                  InkWell(
                    onTap: (){
                      Get.to(()=>HomeScreen());
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("Leave Chat",
                          style: GoogleFonts.outfit(
                              color: AppColors.whitekColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700
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
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                ),
              ),
            ],
          ),

          FlutterSwitch(
            inactiveColor: AppColors.cPrimaryColor,
            activeColor: Colors.red,
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
  Padding buildSettingContainer({required String text,var ontogal,bool status = false,}) {
    return
      Padding(
        padding: const EdgeInsets.all(8),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Image.asset(img,height: 20,),
                SizedBox(
                  width: 10,
                ),
                Text(text,
                  style: GoogleFonts.outfit(
                      color: AppColors.whitekColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios,color: AppColors.greylight,size: 18,)
          ],
        ),
      );
  }
}
