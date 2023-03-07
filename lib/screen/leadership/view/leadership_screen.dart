import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/screen/home/controller/home_screen_controller.dart';
import 'package:improvescap/utils/colors.dart';
import '../../../GetStorage/get_storage_controller.dart';
import '../../../models/daily_goals_model.dart';
import '../../../models/leaderboard_model.dart';
import '../../../reusable_widgets/bottom_navigation_bar.dart';
import '../../../reusable_widgets/custtom_app_bar.dart';
import '../../add_logo/view/add_logo_screen.dart';
import '../../home/component/home_screen_component.dart';
import '../../improv_scap_prumium/view/improvscap_prumum.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/view/profile_screen.dart';
import '../../improv_scap_prumium/controller/payment_controller.dart';


class LeaderShipScreen extends StatefulWidget {
  @override
  State<LeaderShipScreen> createState() => _LeaderShipScreenState();
}

class _LeaderShipScreenState extends State<LeaderShipScreen> {
  var homeController = Get.put(HomeScreenController());
  var paymentController = Get.put(PaymentController());

  // @override
  // void initState() {
  //   getCurrentUserData();
  // }
  //
  // var profileControler = Get.put(ProfileController());
  //
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
      backgroundColor: AppColors.cPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("leaderboard",style: GoogleFonts.outfit(
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
          //       child: CircleAvatar(
          //           backgroundImage: NetworkImage(profileControler.imageController.text.toString()))),
          // )
        ],
      ),
      // CusttomAppBar().buildAppBar(
      //   text: "leaderboard"
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Image.asset(ImageConstant.pic1,width: 80,height: 80,fit: BoxFit.fill,),
                              SizedBox(height: 10,),
                              Container(
                                height: 180,
                                  width: MediaQuery.of(context).size.width /3.78,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xffF7D649),
                                        const Color(0xffEF55A8),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                                  child: Column(
                                    children: [
                                      Text("Maria",style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: AppColors.whitekColor,
                                      ),),
                                      Text("36 Logs",style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.whitekColor,
                                      ),),
                                      Text("2",style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 60,
                                        color: AppColors.whitekColor,
                                      ),),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Image.asset(ImageConstant.topper,width: 140,height: 120,fit: BoxFit.cover,),

                              Container(
                                height: 210,
                                width: MediaQuery.of(context).size.width /2.78,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xff515AFD),
                                        const Color(0xff81A2FE),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text("Maria",style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: AppColors.whitekColor,
                                      ),),
                                      Text("36 Logs",style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.whitekColor,
                                      ),),
                                      Text("1",style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 100,
                                        color: AppColors.whitekColor,
                                      ),),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Image.asset(ImageConstant.pic2,width: 80,height: 80,fit: BoxFit.fill,),
                              SizedBox(height: 10,),
                              Container(
                                height: 143,
                                width: MediaQuery.of(context).size.width /3.8,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xffE0424A),
                                        const Color(0xffF68841),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                                  child: Column(
                                    children: [
                                      Text("Maria",style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: AppColors.whitekColor,
                                      ),),
                                      Text("36 Logs",style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.whitekColor,
                                      ),),
                                      Text("3",style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 40,
                                        color: AppColors.whitekColor,
                                      ),),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return
                          InkWell(
                            onTap: (){
                              //Get.to(()=>ChatScreen(categoriesModel: catogriies[index]));
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(leaderboard[index].image),
                              ),
                              title: Text(leaderboard[index].name_title,style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppColors.whitekColor

                              ),),
                              subtitle: Text("Sultan",style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.whitekColor
                              ),),
                              trailing: Text(leaderboard[index].rank,style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.cPrimaryColor

                              ),),
                            ),
                          );
                      }),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:CustomBottomNavBar(index: 3),
    );
  }
}
