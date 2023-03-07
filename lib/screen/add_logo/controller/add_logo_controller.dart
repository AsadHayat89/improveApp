import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:uuid/uuid.dart';
import '../../../models/add_logo_model.dart';
import '../../../services/api_services.dart';
import '../../../utils/Dialouge_Boxes.dart';
import '../../home/view/home_screen.dart';



class AddLogodetailesController extends GetxController {

  Uuid uuid = Uuid();
  final formKey = GlobalKey<FormState>();
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;
  ImagePicker imagePicker = ImagePicker();
  File? file;
  var downloadURL;
 var descriptionTextController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  var gym = 0.obs;
  var skill = 0.obs;
  var read = 0.obs;
  var title = TextEditingController();
  var price = TextEditingController();
  var description = TextEditingController();
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
  // uploadImageToFirebase({
  //   var title,
  //   var category,
  //   var price,
  //   var description,
  //   var isfavorite,
  // }) async {
  //   String filename = Path.basename(file!.path);
  //   Reference storageReference =
  //   FirebaseStorage.instance.ref().child("posts" + filename);
  //   isLoading.value = true;
  //   final UploadTask uploadTask = storageReference.putFile(file!);
  //   final TaskSnapshot downloadUrl = (await uploadTask);
  //   print("get image upload task");
  //   downloadURL = await downloadUrl.ref.getDownloadURL().whenComplete(() {
  //     print("get image get url");
  //     isLoading.value = false;
  //     Get.snackbar("Message", "Your data uploaded succesfully",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white);
  //   });
  //
  //   await addPropertyDetailsToFirestore(
  //
  //       description: description,
  //       price: price,
  //       title: title,
  //       category: category,
  //       isfavorite: isfavorite,
  //       image: downloadURL);
  //   print(downloadURL.toString() + "down");
  // }
  //
  //
  // addPropertyDetailsToFirestore({
  //
  //   var description,
  //   var price,
  //   var title,
  //   var category,
  //   var isfavorite,
  //   var image,
  //   var publish,
  //   var docid
  // }) async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //
  //   User? user = _auth.currentUser;
  //
  //   AddLogoModel addLogoModel = AddLogoModel();
  //   // addLogoModel.uid = user!.uid;
  //   // addLogoModel.description = description;
  //   // addLogoModel.title = title;
  //   // addLogoModel.category = category;
  //   // addLogoModel.price = price;
  //   // addLogoModel.isfavorite = "false";
  //   // addLogoModel.iscompleted = "false";
  //   addLogoModel.image = image;
  //   addLogoModel.documentId = uuid.v1();
  //   await firebaseFirestore
  //       .collection("AddLogoDetailes")
  //       .doc(addLogoModel.documentId)
  //       .set(addLogoModel.toMap())
  //       .then((value) {
  //     Get.offAll(()=>HomeScreen());
  //
  //   });
  // }

  Future add_logo({
    required String description,
    required String image,
    required String gym,
    required String skill,
    required String read,
  }) async {
    try {
      isLoading.value = true;
      print("testttt");
      var detail = await ApiServices.add_logo_service(
         description: description,
          image: image,
         gym: gym,
        skill: skill,
        read: read

      );
      print(detail.toString());
      if (detail != null) {
        isLoading.value = false;
        Get.offAll(()=>HomeScreen());

      } else
        isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.toString());
    }
  }

  void addLogobutton() {
    final isValid = formKey.currentState!.validate();
    if (isValid || selectedImagePath.value != "") {
      print("valid");
      add_logo(
        description: descriptionTextController.value.text,
        image: selectedImagePath.value,
        gym: gym.value.toString(),
        skill: skill.value.toString(),
        read: read.value.toString()

      );
      log("read value " + read.value.toString());
      log("gym value " + gym.value.toString());
      log("skill value " + skill.value.toString());
    } else
      print("not valid");
  }
}