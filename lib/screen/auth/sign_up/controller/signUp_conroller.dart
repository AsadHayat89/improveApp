import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:improvescap/screen/auth/login_screen/view/login_screen.dart';
import 'package:improvescap/services/api_services.dart';

import '../../../../utils/Dialouge_Boxes.dart';


class SignUpController extends GetxController
{

  var selectImagePath = "".obs;
  var selectImageSize = "".obs;
  var isLoading = false.obs;


  void getImage(ImageSource imageSource)async
  {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile != null)
    {
      selectImagePath.value = pickedFile.path;
      //api
      //updateProfileImage();
      selectImageSize.value = ((File(selectImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+"MB";

    }
    else{
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor:Colors.red,
          colorText: Colors.white
      );
    }

  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  //TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  //var registerModel = RegisterModel().obs;
  RxBool hidePassword = true.obs;

  void showpassword() {
    if (hidePassword.value) {
      hidePassword.value = false;
    } else if (hidePassword.value == false) {
      hidePassword.value = true;
    }
  }

  final signupFormKey = GlobalKey<FormState>();
 // RxBool isLoading = false.obs;

  Future register_now({
    required String name,
    required String email,
    required String password,

    required String image,
  }) async {
    try {
      isLoading.value = true;
      print("testttt");
      var detail = await ApiServices.api_registeration(
        email: email,
        password: password,
        name: name,
      image: image);
      print(detail.toString());
      if (detail != null) {
        isLoading.value = false;
          Get.offAll(()=>LoginScreen());

      } else
        isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.toString());
    }
  }

  void signupbutton() {
    final isValid = signupFormKey.currentState!.validate();
    if (isValid) {
      print("valid");
      register_now(
          email: email.value.text,
          password: password.value.text,
          image: selectImagePath.value,
          name: name.value.text,
      );
    } else
      print("not valid");
  }

}