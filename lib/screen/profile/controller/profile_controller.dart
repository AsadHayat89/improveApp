import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:improvescap/models/user_detailes_model.dart';
import 'package:improvescap/screen/profile/view/profile_screen.dart';

import '../../../GetStorage/get_storage_controller.dart';
import '../../../services/api_services.dart';
import '../../../utils/Dialouge_Boxes.dart';
import '../../../utils/storage.dart';

class ProfileController extends GetxController{

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userNameController.text = Get.find<GetSTorageController>().getloginModel()!.data!.name.toString();
    emailController.text = Get.find<GetSTorageController>().getloginModel()!.data!.email.toString();
    dateOfBirthController.text = Get.find<GetSTorageController>().getloginModel()!.data!.dob.toString();
    countryController.text = Get.find<GetSTorageController>().getloginModel()!.data!.country.toString();
  }


  final profileFormKey = GlobalKey<FormState>();
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;
  ImagePicker imagePicker = ImagePicker();
  File? file;
  var descriptionTextController = TextEditingController();

  var isLoading = false.obs;



  Future getImage(ImageSource imageSource) async {
    final pickedFile =
    await imagePicker.getImage(source: imageSource, imageQuality: 85);
    if (pickedFile != null) {
      print("get image if");
      selectedImagePath.value = pickedFile.path;
      file = File(pickedFile.path);
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
              "Mb";
    } else {
      print("get image else");
      Get.snackbar(
        "Error",
        "No image selected",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    update();
    print("get image upload function");
    update();

  }


  Future profile_update({
    required String dob,
    required String name,
    required String country,
    required String image,
  }) async {
    try {
      isLoading.value = true;
      print("testttt");
      var detail = await ApiServices.profile_update(
         name: name,
          dob: dob,
          country: country,
          image: image

      );
      print(detail.toString());
      if (detail != null) {
        isLoading.value = false;
        Get.offAll(()=>ProfileScreen());

      } else
        isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.toString());
    }


  }


  void profileUpdatebutton() {
    final isValid = profileFormKey.currentState!.validate();
    if (isValid || selectedImagePath.value != "") {
      print("valid");
      profile_update(
          name: userNameController.value.text,
          dob: dateOfBirthController.value.text,
          country: countryController.text,
          image: selectedImagePath.value
      );
    } else
      print("not valid");
  }

}
