import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:improvescap/api_model/search_model.dart';
import 'package:improvescap/api_model/show_all_logo.dart';
import 'package:improvescap/screen/chat_list/view/chat_list.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';

import '../../../../../services/api_services.dart';
import '../../../../../utils/Dialouge_Boxes.dart';
import '../view/daily_screen_view.dart';


class SearchChatController extends GetxController{
  var selectCon1 = false.obs;
  var selectCon2 = false.obs;
  var selectCon3 = false.obs;

  var searchGroupName = "".obs;
  var searchGroupNameController = TextEditingController();



  var isLoading = false.obs;
  var isEdit = false.obs;
  var model = ShowAllGroupModel().obs ;
  var isEmpty = false.obs;
  var getdata;

  @override
  void onInit()async {
    super.onInit();


  }

  Future<ShowAllGroupModel?> showAllLogoData() async{
    try {
      isLoading.value = true;
      var detail = await ApiServices.seachChatService();
      if (detail != null) {
        model.value=detail;
        print("Pending Order $model");
        return model.value;
      }
      else{
        isEmpty(true);
      }
    }
    finally
    {
      isLoading(false);
    }
    return model.value;
  }




  final formKey = GlobalKey<FormState>();
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;
  ImagePicker imagePicker = ImagePicker();
  File? file;
  var downloadURL;
  var descriptionTextController = TextEditingController();

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var gPasswordController = TextEditingController();
  var memberAmount ;
  var privateVlaue ;
  var isfavorite = TextEditingController();



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


  Future add_group({
    required String name,
    required String description,
    required String member_amount,
    required String private,
    required String password,
    required String image,
  }) async {
    try {
      isLoading.value = true;
      print("testttt");
      var detail = await ApiServices.add_group_service(
          description: description,
          image: image,
         name: name,
        member_amount: member_amount,
        password: password,
        private: private

      );
      print(detail.toString());
      if (detail != null) {
        isLoading.value = false;
        Get.offAll(()=>DailyGoals());

      } else
        isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.toString());
    }
  }

  void addgroupChatbutton() {
    final isValid = formKey.currentState!.validate();
    if (isValid || selectedImagePath.value != "") {
      print("valid");
      add_group(
        description: descriptionTextController.value.text,
        image: selectedImagePath.value,
        name: nameController.value.text,
        private: privateVlaue.toString(),
        password: gPasswordController.value.text,
        member_amount: memberAmount.toString()

      );
    } else
      print("not valid");
  }





}