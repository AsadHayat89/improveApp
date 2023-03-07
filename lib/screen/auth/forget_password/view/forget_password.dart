import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';
import 'package:improvescap/utils/colors.dart';

import '../../../../reusable_widgets/bottom_navigation_bar.dart';
import '../../../../reusable_widgets/custom_textfield.dart';
import '../../../../utils/image_picker.dart';
import '../../login_screen/view/login_screen.dart';
import '../../sign_up/view/sign_sp_screen.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final emailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  var obscureText_old ;
  var obscureText ;
  @override
  void initState() {
    super.initState();
    setState(() {
      obscureText = false;
      obscureText_old = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: InkWell(
                    onTap: (){
                      Get.to(()=>LoginScreen());
                    },
                    child: Icon(Icons.arrow_back_ios,color: AppColors.whitekColor,)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Image.asset(ImageConstant.logoImage),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    CustomPasswordTextfield(
                      controller: emailcontroller,
                      hinttext: "Enter Email",
                      obscTextTrue: false,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    InkWell(
                      onTap: (){
                        auth.sendPasswordResetEmail(email: emailcontroller.text.toString()).then((value) {
                          Get.snackbar("Sent Link","We have sent you email to recover password, please check email",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor:Colors.green,
                              colorText: Colors.white
                          );
                        }).onError((error, stackTrace) {
                          showSnackBar(error.toString(), context);
                        });
                        // Get.to(()=>HomeScreen());
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.cPrimaryColor,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Send a link to reset password",style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.whitekColor,
                              ),),
                              Image.asset(ImageConstant.arrow_icon,width: MediaQuery.of(context).size.width*0.1,)
                            ],
                          ),
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
    );
  }
}
