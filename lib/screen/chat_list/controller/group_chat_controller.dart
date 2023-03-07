import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improvescap/api_model/search_model.dart';
import 'package:improvescap/api_model/show_all_logo.dart';
import 'package:improvescap/api_model/show_group_chat_message.dart';

import '../../../../../services/api_services.dart';
import '../../../api_model/group_chat_model.dart';
import '../../../utils/Dialouge_Boxes.dart';
import '../view/chat_list.dart';
import 'package:improvescap/api_model/show_group_chat_message.dart';


class GroupChatController extends GetxController{
    // GroupChatController({this.gp_id});
  var selectCon1 = false.obs;
  var selectCon2 = false.obs;
  var selectCon3 = false.obs;
  ScrollController scrollController = ScrollController();
  var sendMessageController = TextEditingController();
  var nameJoinController = TextEditingController();
  var passwordJoinController = TextEditingController();


  var isLoading = false.obs;
  var isLoadingMessage = false.obs;
  var isEdit = false.obs;
  var isEditMessage = false.obs;
  Rx<ShowMyGroupModel> model = ShowMyGroupModel().obs ;
  Rx<ShowGroupMessagesModel> modelMesages = ShowGroupMessagesModel().obs ;
  var isEmpty = false.obs;
  var isEmptyMessage = false.obs;
  var getdata;
  var getMessagedata;
  var gp_id;

  @override
  void onInit()async {
    super.onInit();
    //getdata =  groupChatData();
  //  getMessagedata =  groupMessagesData( );

  }

  Future<ShowMyGroupModel?> groupChatData() async{
    try {
      isLoading.value = true;
      var detail = await ApiServices.groupChatService();
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


  /// Group Messages.......................
  Future<ShowGroupMessagesModel?> groupMessagesData({var gp_id}) async{
    try {
      isLoadingMessage.value = true;
      print("groupID: "+gp_id.toString());
      var detail = await ApiServices.showgroupMessagesService(gp_id: gp_id);
      if (detail != null) {
        modelMesages.value=detail;
        print("Pending Order $model");
        return modelMesages.value;
      }
      else{
        isEmptyMessage(true);
      }
    }
    finally
    {
      isLoadingMessage(false);
    }
    return modelMesages.value;
  }



  final chatFormKey = GlobalKey<FormState>();
  final joinFormKey = GlobalKey<FormState>();
  // RxBool isLoading = false.obs;

  Future sendMessage({
    var group_id,
    var message,
    var sender_id,

  }) async {
    try {
      isLoading.value = true;
      print("Chat Sending....");
      var detail = await ApiServices.sendMessageInGroupService(
      group_id: group_id,
      message: message,
          sender_id: sender_id
      );
      print(detail.toString());
      if (detail != null) {
        isLoading.value = false;
        getMessagedata =  groupMessagesData();
        Datummessage d=new Datummessage(message: message,senderId: sender_id);
        modelMesages.value.data!.add(d);

          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        sendMessageController.text = "";
        update();
      } else
        isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.toString());
    }
  }


  Future joinGroup({
    var name,
    var password,

  }) async {
    try {
      isLoading.value = true;
      print("Chat Sending....");
      var detail = await ApiServices.joinChatService(
          name: name,
        password: password,
      );
      print(detail.toString());
      if (detail != null) {
        isLoading.value = false;
        Get.offAll(()=>ChatList());


      } else
        isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.toString());
    }
  }
  //
  // void signupbutton() {
  //   final isValid = signupFormKey.currentState!.validate();
  //   if (isValid) {
  //     print("valid");
  //     register_now(
  //       email: email.value.text,
  //       password: password.value.text,
  //       image: selectImagePath.value,
  //       name: name.value.text,
  //     );
  //   } else
  //     print("not valid");
  // }






}
