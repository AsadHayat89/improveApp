import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/screen/auth/login_screen/controller/login_controller.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';
import 'package:improvescap/utils/colors.dart';
import '../../../../reusable_widgets/custom_textfield.dart';
import '../../../../services/auth_services.dart';
import '../../../../utils/image_picker.dart';
import '../../forget_password/view/forget_password.dart';
import '../../sign_up/view/sign_sp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  var obscureText ;

  @override
  void initState() {
    super.initState();
    setState(() {
      obscureText = false;
    });
  }
  var loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: loginController.loginFormKey,
            child: Column(
              children: [
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
                      CustomeTextfield(
                        valid: validateEmail,
                        controller: loginController.userEmail,
                        hinttext: "Email",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CustomPasswordTextfield(
                        valid: password,
                        controller: loginController.password,
                        hinttext: "Password",
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
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(()=>ForgetScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Forgot password ?",style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: AppColors.whitekColor,
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                     Obx(() =>  InkWell(
                       onTap: (){
                         loginController.loginbutton();
                       },
                       child:loginController.isLoading.value ? Center  (child: CircularProgressIndicator(
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
                               Text("Login",style: GoogleFonts.outfit(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: AppColors.borderColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Or sign in with",style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.whitekColor,
                            ),),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: AppColors.borderColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: (){
                                     loginController.signInWithGoogle();
                              },
                              child: Image.asset(ImageConstant.google,height: 70,)),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      InkWell(
                        onTap:(){
                          Get.to(()=>SignUpScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don’t have an account?",style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.grey,
                            ),),
                            Text("Sign Up",style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.whitekColor,
                            ),),
                          ],
                        ),
                      ),
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
    else
      return null;
  }
  String? password(String? value) {
    if (value!.length < 6)
      return 'Password must be more than 5 charater';
    else
      return null;
  }

}
