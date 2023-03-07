import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/screen/auth/sign_up/controller/signUp_conroller.dart';
import 'package:improvescap/utils/colors.dart';
import '../../../../reusable_widgets/custom_textfield.dart';
import '../../../../services/auth_services.dart';
import '../../../../utils/image_picker.dart';
import '../../login_screen/view/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  var obscureText ;
  var signupController = Get.put(SignUpController());
  @override
  void initState() {
    super.initState();
    setState(() {
      obscureText = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: signupController.signupFormKey,
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
                  height: MediaQuery.of(context).size.height * 0.10,
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
                        height: 40,
                      ),
                    Obx(() =>   Stack(
                      children: [
                        signupController.selectImagePath.value != ""? CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(File(signupController.selectImagePath.value),
                            ) )
                            : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              border: Border.all(width: 1,color: Colors.white)
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlDEwom8riwMB8MQPZPeXkSwvdNJwcFMyETy62bkkHILu88GAFPBoFIigl5xcok122sPY&usqp=CAU"),
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
                                    if (signupController.isLoading.value) {
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
                                          signupController
                                              .getImage(ImageSource.gallery);
                                          Get.back();
                                        },
                                        child: Text(
                                          "Gallery",
                                          style: TextStyle(color: Colors.white),
                                        ));
                                  }),
                                  Obx(() {
                                    if (signupController.isLoading.value) {
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
                                          signupController
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
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Icon(Icons.add,color: AppColors.blackColor,),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CustomeTextfield(
                        valid: validateEmail,
                        hinttext: "Email",
                        controller: signupController.email,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CustomeTextfield(
                        valid: validateName,
                        hinttext: "Username",
                        controller: signupController.name,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CustomPasswordTextfield(
                        valid: passwordValid,
                        hinttext: "Password",
                        controller: signupController.password,
                        suficIcons: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color:AppColors.cPrimaryColor,
                          ),
                        ),
                        obscTextTrue: !obscureText,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.040,
                      ),
                     Obx(() =>  InkWell(
                       onTap: (){
                         signupController.signupbutton();
                       },
                       child:signupController.isLoading.value ? Center  (child: CircularProgressIndicator(
                         color: Color(0xff2FE4A3),
                       ),) : Container(
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
                               Text("Signup",style: GoogleFonts.outfit(
                                 fontWeight: FontWeight.w600,
                                 fontSize: 18,
                                 color: AppColors.whitekColor,
                               ),),
                               Image.asset(ImageConstant.arrow_icon,width: 50,)
                             ],
                           ),
                         ),
                       ),
                     ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else return null;
  }
  String? validateName(String? value) {
    if (value!.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }
  String? passwordValid(String? value) {
    if (value!.length < 6)
      return 'password must be more than 5 charater';
    else
      return null;
  }

}
