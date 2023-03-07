import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:improvescap/models/user_model.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';

import '../../../../GetStorage/get_storage_controller.dart';
import '../../../../api_model/LogginModel.dart';
import '../../../../api_model/Login_model.dart';
import '../../../../services/api_services.dart';
import '../../../../utils/Dialouge_Boxes.dart';

class LoginController extends GetxController{

  TextEditingController userEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  var loginModel = LoginModel().obs;
  
  Future login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      print("testttt");
      var detail =
      await ApiServices.api_login(email: email, password: password);
      print(detail.toString());
      if (detail != null) {
        print(detail.toString() + "detailssssssssss");
        // loginModel.value = detail;
        // await Get.find<GetSTorageController>()
        //     .storeLoginModel(loginModel.value);
        // Get.find<GetSTorageController>().writeStorage("isLogged", "isLogged");

        if (detail is LoginModel) {
          loginModel.value = detail;
          await Get.find<GetSTorageController>()
              .storeLoginModel(loginModel.value);
          Get.find<GetSTorageController>().writeStorage("isLogged", "isLogged");
          isLoading.value = false;
          Get.offAll(() => HomeScreen());
          isLoading.value = false;
          return loginModel.value;
        }
      } else
        isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.toString());
    }
  }

 

  final loginFormKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  void loginbutton() {
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      print("okkkk");
      login(
        email: userEmail.value.text,
        password: password.value.text,
      );
    } else
      print("not ok");
  }

 
  signInWithGoogle()async{
    final  GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
      var currentuser = await FirebaseFirestore.instance
          .collection("user")
          .where('email', isEqualTo:  FirebaseAuth.instance.currentUser!.email.toString())
          .get();
      final List<DocumentSnapshot> documents = currentuser.docs;
      if (documents.length > 0)
      {
        Get.to(()=>HomeScreen());
        Get.snackbar("Google Login", "Google login Successfully...",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor:Colors.green,
            colorText: Colors.white
        );
      } else {
        FirebaseAuth _auth = FirebaseAuth.instance;
        User? user = _auth.currentUser;
        UserModel newuser = UserModel(
          username: user!.displayName.toString(),
          uid : user.uid,
          email: user.email.toString(),
          photoUrl : user.photoURL.toString(),
          dateofBirth: '',
          country: '',
        );
        await FirebaseFirestore.instance
            .collection("user")
            .doc(user.uid)
            .set(newuser.toMap())
            .then((value) {
          Get.to(()=>HomeScreen());
          Get.snackbar("Google Login", "Google login Successfully...",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor:Colors.green,
              colorText: Colors.white
          );
        });

      }



    });
  }
}