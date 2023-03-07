import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/api_model/Login_model.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/models/add_logo_model.dart';
import 'package:improvescap/screen/add_logo/view/delete_logo.dart';
import 'package:improvescap/screen/home/controller/home_screen_controller.dart';
import 'package:improvescap/utils/colors.dart';
import '../../../GetStorage/get_storage_controller.dart';
import '../../../reusable_widgets/bottom_navigation_bar.dart';
import '../../add_logo/view/add_logo_screen.dart';
import '../../improv_scap_prumium/view/improvscap_prumum.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/view/profile_screen.dart';
import '../component/home_screen_component.dart';
import '../component/home_screen_component.dart';
import '../component/home_screen_component.dart';
import '../screens/daily_goals/view/daily_screen_view.dart';

class HomeScreen extends StatefulWidget {
  final List<String>? image;
  HomeScreen({this.image});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 var homeController = Get.put(HomeScreenController());
 // @override
 // void initState() {
 //   getCurrentUserData();
 // }

 var profileControler = Get.put(ProfileController());
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
 int activeIndex = 0;
 setActiveDot(index) {
   setState(() {
     activeIndex = index;
   });
 }

 final showAllLogo = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
   log("imagee "+Get.find<GetSTorageController>().getloginModel()!.data!.image.toString());
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar:
      AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Get.to(()=>ImprovScapPrumuim());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Image.asset(ImageConstant.diamond,
            ),
          ),
        ),
        title: Text("ImproveScape",style: GoogleFonts.outfit(
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
                child:  CircleAvatar(
                    backgroundImage: NetworkImage(Get.find<GetSTorageController>().getloginModel()!.data!.image.toString()))
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.020,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap:(){
                                  // Get.to(()=>DailyGoals());
                                },
                                child: Text("Daily Goals",style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.greylight,
                                ),),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.edit_outlined,color: Colors.white,size: 20,),
                                  SizedBox(width: 5,),
                                  Text("Edit",style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.greylight,
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.014,
                          ),
                         Obx(()=> HomeScreenComponent().buildContainer(text: 'Go to the gym',
                             color:homeController.selectCon1.value ? AppColors.cPrimaryColor: Color(0xff201E23), onTap: (){
                                 homeController.selectCon1.value =! homeController.selectCon1.value;
                             }
                         ),),
                          SizedBox(height: 7,),
                          Obx(()=> HomeScreenComponent().buildContainer(text: 'Read a book',
                              color:homeController.selectCon2.value ? AppColors.cPrimaryColor: Color(0xff201E23), onTap: (){
                                homeController.selectCon2.value =! homeController.selectCon2.value;
                              }
                          ),),
                          SizedBox(height: 7,),
                          Obx(()=> HomeScreenComponent().buildContainer(text: 'Learn a new skill',
                              color:homeController.selectCon3.value ? AppColors.cPrimaryColor: Color(0xff201E23), onTap: (){
                                homeController.selectCon3.value =! homeController.selectCon3.value;
                              }
                          ),),
                          SizedBox(height: 12,),
                        ],
                      ),
                    ),


                    // CustomeCarouselHomePage(
                    //   items: imageList,
                    // ),


                    Obx(() {
                      if (homeController.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (homeController
                          .model.value.the1!.length==0) {
                        log("empty");
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 180),
                            child: Text(
                                "No Order Found",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black)),
                          ),
                        );
                      }
                      if (homeController
                          .isEmpty.value) {
                        log("empty");
                        return Center(
                          child: Text(
                              "No Order Found",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black)),
                        );
                      }

                      return   Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.35,
                       // padding: EdgeInsets.symmetric(horizontal: 30),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                           scrollDirection: Axis.horizontal,
                          //  physics: ScrollPhysics(),
                            primary: true,
                            itemCount:homeController
                                .model.value.the1!.length,
                            itemBuilder: (context, index) {
                              var items =
                              homeController.model.value.the1![index];
                              return   InkWell(
                                onTap: (){
                                  Get.to(()=>DeleteLogo(
                                      logo_id: items.id.toString(),
                                    userId: items.userId.toString(),
                                      caption: items.description.toString(),
                                      image: items.image.toString(),
                                        gym: items.gym.toString(),
                                        skill: items.skill.toString(),
                                         readd: items.read.toString(),
                                  ));
                                },
                                child: Container(
                                  width: 300,
                                  height: MediaQuery.of(context).size.height*0.43,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.transparent,
                                      image: DecorationImage(image: NetworkImage(items.image.toString(),),fit: BoxFit.fill,)
                                  ),

                                ),
                              );
                            }),
                      );
                    }),

                    // FutureBuilder<QuerySnapshot?>(
                    //     future: FirebaseFirestore.instance
                    //         .collection('AddLogoDetailes')
                    //         .get(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.connectionState ==
                    //           ConnectionState.waiting) {
                    //         return Center(
                    //           child: CircularProgressIndicator.adaptive(),
                    //         );
                    //       } else if (snapshot.connectionState == ConnectionState.done) {
                    //         if (snapshot.hasData) {
                    //           QuerySnapshot data = snapshot.data as QuerySnapshot;
                    //           return
                    //             Container(
                    //               height: 250,
                    //               child: ListView.builder(
                    //                   itemCount: data.docs.length,
                    //                   scrollDirection: Axis.vertical,
                    //                   itemBuilder:
                    //                       (BuildContext context, int index) {
                    //                         final addLogoModel = AddLogoModel.fromMap(
                    //                               data.docs[index].data()
                    //                               as Map<String, dynamic>);
                    //                     // var indexx = snapshot.data!.docs[index];
                    //                     // print(data.docs.length.toString());
                    //                     // AddLogoModel addLogoModel =
                    //                     // AddLogoModel.fromMap(
                    //                     //     data.docs[index].data()
                    //                     //     as Map<String, dynamic>);
                    //
                    //                     return Padding(
                    //                       padding: const EdgeInsets.symmetric(horizontal: 20),
                    //                       child: Container(
                    //                         height: 250,
                    //                         width: double.infinity,
                    //                         decoration: BoxDecoration(
                    //                           borderRadius: BorderRadius.circular(10),
                    //                           image: DecorationImage(
                    //                             image: NetworkImage(addLogoModel.image.toString(),),
                    //                             fit: BoxFit.fill
                    //                           )
                    //                         ),
                    //                       ),
                    //                     );
                    //                   }),
                    //             );
                    //         } else if (snapshot.hasError) {
                    //           return Container(
                    //             height: 250,
                    //             width: double.infinity,
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 image: DecorationImage(
                    //                     image: AssetImage("assets/home_image/scroll_image.png"),
                    //                     fit: BoxFit.fill
                    //                 )
                    //             ),
                    //           );
                    //         } else {
                    //           return  Container(
                    //             height: 250,
                    //             width: double.infinity,
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 image: DecorationImage(
                    //                     image: AssetImage("assets/home_image/scroll_image.png"),
                    //                     fit: BoxFit.fill
                    //                 )
                    //             ),
                    //           );
                    //         }
                    //       }
                    //
                    //       return Container(
                    //         height: 250,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             image: DecorationImage(
                    //                 image: AssetImage("assets/home_image/scroll_image.png"),
                    //                 fit: BoxFit.fill
                    //             )
                    //         ),
                    //       );
                    //     }),



                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          child: InkWell(
                            onTap: (){
                              Get.to(()=>AddLogo());
                            },
                            child: Row(
                              children: [
                                Text("Add Your Logs",style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.whitekColor,
                                ),),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.015,
                                ),
                                Image.asset(ImageConstant.arrow_icon,height: 10,)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(()=>AddLogo(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 500));
                          },
                          child: Container(
                            height: 57,
                            width: 70,
                            decoration: BoxDecoration(
                              color: AppColors.cPrimaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  bottomLeft: Radius.circular(100)
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.whitekColor,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),




                  ],
                ),
              ),
              Image.asset(ImageConstant.bottom,width: double.infinity,fit: BoxFit.fill,)
            ],
          ),
        ),
      ),
      bottomNavigationBar:CustomBottomNavBar(index: 2),
    );
  }
}
