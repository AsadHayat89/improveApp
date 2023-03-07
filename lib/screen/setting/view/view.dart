import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/reusable_widgets/bottom_navigation_bar.dart';
import 'package:improvescap/screen/profile/view/profile_screen.dart';
import 'package:improvescap/utils/colors.dart';

import '../../../GetStorage/get_storage_controller.dart';
import '../../../generated/assert.dart';
import '../../../reusable_widgets/custtom_app_bar.dart';
import '../../hallof_fame/view/hallof_fame_screen.dart';
import '../../profile/controller/profile_controller.dart';
import '../../reminder/view/set_reminder.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {
  bool stat1 = false;
  bool stat2 = false;
  // @override
  // void initState() {
  //   getCurrentUserData();
  // }
  //
  // var profileControler = Get.put(ProfileController());
  // Future<void> getCurrentUserData() async {
  //   FirebaseFirestore.instance
  //       .collection('user')
  //       .where("uid", isEqualTo: (FirebaseAuth.instance.currentUser!).uid)
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       Get.find<GetStorageController>()
  //           .writeStorage("Image", value.docs[0]['photoUrl'].toString());
  //     });
  //   }).then((value) {
  //     profileControler.imageController.text =
  //         Get.find<GetStorageController>().box.read("Image").toString();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Text("Setting",style: GoogleFonts.outfit(
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
                    backgroundImage: NetworkImage(Get.find<GetSTorageController>().getloginModel()!.data!.image.toString())),
                    // child: Image.network(),
          ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff201E23)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildSettingContainer(text: 'Profile',status: stat1, onTap:(){
                        Get.to(()=>ProfileScreen());

                      },ontogal: (val) {
                        setState(() {
                          stat1 = val;
                        });
                      }, img: ImageConstant.profile_s,),
                      buildSettingContainer(text: 'Contact us',status: stat1, ontogal: (val) {
                        setState(() {
                          stat1 = val;
                        });

                      }, img: ImageConstant.contact,),
                      buildReminderContainer(text: 'Notification',
                        status: stat1, ontogal: (val) {
                        setState(() {
                          stat1 = val;
                        });

                      },

                        img: ImageConstant.notification,),
                      buildReminderContainer(text: 'Private',
                        status: stat2, ontogal: (val) {
                          setState(() {
                            stat2 = val;
                          });

                        },

                        img: ImageConstant.private,),
                      // Padding(
                      //   padding: const EdgeInsets.all(8),
                      //   child:
                      //   Row(
                      //     children: [
                      //       Image.asset(ImageConstant.private,height: 20,),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Text("Private",
                      //         style: GoogleFonts.outfit(
                      //             color: AppColors.whitekColor,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w700
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      InkWell(
                        onTap: (){
                          Get.to(()=>SetReminder());
                        },
                        child: buildSettingContainer(text: 'Set Reminder',status: stat1,
                          ontogal: (val) {
                          setState(() {
                            stat1 = val;
                          });
                        }, img: ImageConstant.timer,),
                      ),

                      InkWell(
                        onTap: (){
                          Get.to(()=>HallofFame());
                        },
                        child: buildSettingContainer(text: 'Hall of Fame',status: stat1, ontogal: (val) {
                          setState(() {
                            stat1 = val;
                          });
                        }, img: ImageConstant.hall_of,),
                      ),

                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(index: 4),
    );
  }

  Padding buildReminderContainer({required String text,var ontogal,bool status = false,required String img,}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(img,height: 20),
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
  InkWell buildSettingContainer({final onTap,required String text,var ontogal,bool status = false,required String img}) {
    return
      InkWell(
        onTap: onTap,
        child: Padding(
        padding: const EdgeInsets.all(8),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(img,height: 20,),
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
    ),
      );
  }
}
