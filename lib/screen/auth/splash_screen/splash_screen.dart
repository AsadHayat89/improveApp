import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/utils/colors.dart';
import 'dart:math' as math;
import '../../../GetStorage/get_storage_controller.dart';
import '../../home/view/home_screen.dart';
import '../login_screen/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () {
              if(Get.find<GetSTorageController>().box.read("isLogged").toString() == "isLogged")
              {
                Get.offAll(()=>HomeScreen());

              }
              else{
                log("loginClicked" + Get.find<GetSTorageController>().box.read("isLogged").toString());
                Get.offAll(()=>LoginScreen());
              }
        }




            // ()=>  Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder:
            //         (context) => LoginScreen()
            //     )
            // )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Center(
            child: Image.asset(ImageConstant.logoImage),
          ),
        )
      ),
    );
  }
}



