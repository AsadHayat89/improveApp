import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improvescap/api_model/show_all_logo.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';

import '../../../services/api_services.dart';
import '../../../utils/Dialouge_Boxes.dart';

class HomeScreenController extends GetxController{
  var selectCon1 = false.obs;
  var selectCon2 = false.obs;
  var selectCon3 = false.obs;




  var isLoading = false.obs;
  var isEdit = false.obs;
  var model = ShowAllLogoModel().obs ;
  var isEmpty = false.obs;
  var getdata;

  @override
  void onInit()async {
    super.onInit();
    getdata =  showAllLogoData();

  }

  Future<ShowAllLogoModel?> showAllLogoData() async{
    try {
      isLoading.value = true;
      var detail = await ApiServices.showAllLogoService();
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



  // delete logo

  Future deleteLogo({
    var logo_id,}) async {
    try {
      isLoading.value = true;
      print("Chat Sending....");
      var detail = await ApiServices.deleteLogoService(
          logo_id: logo_id,);
      print(detail.toString());
      if (detail != null) {
        isLoading.value = false;
        Get.offAll(()=>HomeScreen());
        // Dialouge_Box.show_snackBarSuccess(
        //     title: "Delete", description:"Logo delete successfully...");
        Get.snackbar("Delete", "Log Deleted Successfully...",
        backgroundColor: Colors.green,
          colorText: Colors.white
        );
      } else
        isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.toString());
    }
  }

}