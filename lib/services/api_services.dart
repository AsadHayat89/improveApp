import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:improvescap/GetStorage/get_storage_controller.dart';
import 'package:improvescap/api_model/show_group_chat_message.dart';
import '../api_model/LogginModel.dart';
import '../api_model/group_chat_model.dart';
import '../api_model/search_model.dart';
import '../api_model/show_all_logo.dart';
import '../utils/Dialouge_Boxes.dart';
import 'api_urls.dart';

class ApiServices {
  static var client = http.Client();

//<-------------------------- REGISTRATION API START -------------------------->
  static Future api_registeration({
    required String name,
    required String email,
    required String password,
    required String image,

  }) async {


    var request = http.MultipartRequest('POST', Uri.parse(Api_Url.Reg_Url));
    request.fields.addAll({
      'name': name,
      'email': email,
      'password': password
    });
    request.files.add(await http.MultipartFile.fromPath('image', image));

    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        print("API response good api_urls.Signup");
        return true;
       // return registerModelFromJson(response.body);
      }
      else if (response.statusCode == 401) {
        // if (requestbody["error"]["email"].toString() ==
        //     "[The email has already been taken.]")
        // {
        //   return Dialouge_Box.show_snackBarError(
        //       title: "Error", description: "The email has already been taken.");
        // }
        // else if (requestbody["error"]["phone"].toString() == "[The phone has already been taken.]")
        // {
        //   return Dialouge_Box.show_snackBarError(
        //       title: "Error", description: "The phone has already been taken.");
        // } else
          return null;
      } else
        return null;
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e);
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.message.toString());
    } catch (e) {
      Dialouge_Box.show_snackBarError(
          title: "Error", description: "Errorrrr");
    }
  }

//<-------------------------- LOGIN API START -------------------------->

  static Future api_login({
    required String email,
    required String password,
  }) async {
    Map<String, String> body = {
      "email": email,
      "password": password,

    };


    print("Api Url: " + Api_Url.LOGIN_Url.toString());
    var response = await client.post(Uri.parse(Api_Url.LOGIN_Url), body: body);
    print("response body "+ response.body);
    final requestbody = json.decode(response.body);

    try {
      print("response body try  "+ requestbody.toString());
      if (response.statusCode == 200) {
        print("response body when success"+ requestbody.toString());
        print("API response good api_urls.LOGIN");
        return loginModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        return Dialouge_Box.show_snackBarError(
            title: "Error", description: "Error");
      } else
        return null;
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e);
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.message.toString());
    } catch (e) {
      Dialouge_Box.show_snackBarError(
          title: "Error", description: requestbody["message"]);
    }
  }



  // <------------------------PROFILE UPDATE---------------------------->
  static Future profile_update({
    required String dob,
    required String country,
    required String name,
    required String image,

  }) async {


    var request = http.MultipartRequest('POST', Uri.parse(Api_Url.UPDATE_PROFILE_Url));
    request.fields.addAll({
      'name': name,
      'dob': dob,
      'country': country
    });
    request.files.add(await http.MultipartFile.fromPath('image', image));

    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        print("API response good api_urls.Signup");
        return true;
        // return registerModelFromJson(response.body);
      } else if (response.statusCode == 401) {

        return null;
      } else
        return null;
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e);
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.message.toString());
    } catch (e) {
      Dialouge_Box.show_snackBarError(
          title: "Error", description: "Errorrrr");
    }
  }

  //<----------------------ADD LOGO ------------------------------------->


  static Future add_logo_service({
    required String description,
    required String image,
    required String gym,
    required String skill,
    required String read,
  }) async {

    log("Inside the UserAccount Api ");
    var headers = {
      'Authorization': "Bearer " +
    Get.find<GetSTorageController>().getloginModel()!.data!.apiToken.toString(),
    };
    var request = http.MultipartRequest('POST', Uri.parse(Api_Url.ADD_LOGO_Url));
    request.fields.addAll({
      'description': description,
      'gym': gym,
      'skill': skill,
      'read': read,
    });
    request.files.add(await http.MultipartFile.fromPath('image', image));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    try {

      if (response.statusCode == 200) {

        print("API response good api_urls.LOGIN");
        return true;
      } else if (response.statusCode == 401) {
        return Dialouge_Box.show_snackBarError(
            title: "Error", description: "Error");
      } else
        return null;
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e);
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.message.toString());
    } catch (e) {
      Dialouge_Box.show_snackBarError(
          title: "Error", description:"Exception error");
    }
  }


  //<----------------Show All Logo------------------------->
  static Future<ShowAllLogoModel> showAllLogoService() async {
    var headers = {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    };

    var response = await http.get(Uri.parse(Api_Url.SHOW_ALL_LOGO_Url), headers: {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    });

    print(response.body.toString());
    print("My All Completed Orders HEADERS ====> ${headers}");
    if (response.toString() != "null" &&
        response.body.toString() != "null" &&
        response.statusCode == 200) {
      return showAllLogoModelFromJson(response.body);
    } else {
      return ShowAllLogoModel();
    }
  }


  //<----------------------SEARCH CHAT --------------------->
  static Future<ShowAllGroupModel> seachChatService() async {
    var headers = {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    };

    var response = await http.get(Uri.parse(Api_Url.SHOW_ALL_GROUP), headers: {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    });

    print(response.body.toString());
    print("My All Completed Orders HEADERS ====> ${headers}");
    if (response.toString() != "null" &&
        response.body.toString() != "null" &&
        response.statusCode == 200) {
      return showAllGroupModelFromJson(response.body);
    } else {
      return ShowAllGroupModel();
    }
  }


  //<----------------------SEARCH CHAT --------------------->
  static Future<ShowMyGroupModel> groupChatService() async {
    var headers = {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    };

    var response = await http.get(Uri.parse(Api_Url.SHOW_MY_GROUP+Get.find<GetSTorageController>().getloginModel()!.data!.id.toString()), headers: {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    });

    print(response.body.toString());
    print("My All Completed Orders HEADERS ====> ${headers}");
    if (response.toString() != "null" &&
        response.body.toString() != "null" &&
        response.statusCode == 200) {
      return showMyGroupModelFromJson(response.body);
    }
    else if (response.statusCode == 404)
    {
      // if (requestbody["error"]["email"].toString() ==
      //     "[The email has already been taken.]")
      // {
      //   return Dialouge_Box.show_snackBarError(
      //       title: "Error", description: "The email has already been taken.");
      // }
      // else if (requestbody["error"]["phone"].toString() == "[The phone has already been taken.]")
      // {
      //   return Dialouge_Box.show_snackBarError(
      //       title: "Error", description: "The phone has already been taken.");
      // } else
      return ShowMyGroupModel();
    }

    else {
      return ShowMyGroupModel();
    }
  }


  //<------------------SEND GROUP MESSAGE---------------------------->
  static Future sendMessageInGroupService({
    var group_id,
    var message,
    var sender_id,
  }) async {
    Map<String, String> body = {
      "group_id": group_id,
      "message": message,
      "sender_id": sender_id,
    };
    print("<-------------------Api Url-------------------->");
    var response =
    await client.post(Uri.parse(Api_Url.SEND_MESSAGE_CHAT_Url), body: body, headers: {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    });
    print(response.body);
    final requestbody = json.decode(response.body);
    print("BODY"+requestbody.toString());
    try {
      print("SEND MESSAGE API HIT INSIDE TRY");
      if (response.statusCode == 200) {
        print("API response good api_urls.ADD ADDRESSES");
        return requestbody;
      } else
        return null;
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e);
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.message.toString());
    } catch (e) {
      Dialouge_Box.show_snackBarError(
          title: "Error", description: requestbody["message"]);
    }
  }



  //<---------------------DELETE LOGO---------------------------->
  static Future deleteLogoService({
    var logo_id,
  }) async {
    Map<String, String> body = {
      "group_id": logo_id,
    };
    print("<-------------------Api Url-------------------->");
    var response =
    await client.post(Uri.parse(Api_Url.DELETE_LOGO_Url+logo_id), body: body, headers: {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    });
    print(response.body);
    final requestbody = json.decode(response.body);
    print("BODY"+requestbody.toString());
    try {
      print("SEND MESSAGE API HIT INSIDE TRY");
      if (response.statusCode == 200) {
        print("API response good api_urls.ADD ADDRESSES");
        return requestbody;
      } else
        return null;
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e);
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.message.toString());
    } catch (e) {
      Dialouge_Box.show_snackBarError(
          title: "Error", description: requestbody["message"]);
    }
  }



  //<------------------------SHOW GROUP CHAT MESSAGE----------------------->
  static Future<ShowGroupMessagesModel> showgroupMessagesService({var gp_id}) async {
    var headers = {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    };

    var response = await http.get(Uri.parse(Api_Url.SHOW_MESSAGE_CHAT_Url+gp_id), headers: {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    });

    print(response.body.toString());
    print("My Show Group chat messages  HEADERS ====> ${headers}");
    if (response.toString() != "null" &&
        response.body.toString() != "null" &&
        response.statusCode == 200) {
      return showGroupMessagesModelFromJson(response.body);
    } else {
      return ShowGroupMessagesModel();
    }
  }

  //<-------------------------ADD GROUP---------------------------->
  static Future add_group_service({
    required String name,
    required String description,
    required String member_amount,
    required String private,
    required String password,
    required String image,
  }) async {

    log("Inside the UserAccount Api ");
    var headers = {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>().getloginModel()!.data!.apiToken.toString(),
    };
    var request = http.MultipartRequest('POST', Uri.parse(Api_Url.ADD_GROUP_Url));
    request.fields.addAll({
      'description': description,
      'name': name,
      'member_amount': member_amount,
      'private': private,
      'password': password,
    });
    request.files.add(await http.MultipartFile.fromPath('image', image));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    try {

      if (response.statusCode == 200) {

        print("API response good api_urls.LOGIN");
        return true;
      } else if (response.statusCode == 401) {
        return Dialouge_Box.show_snackBarError(
            title: "Error", description: "Error");
      } else
        return null;
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e);
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.message.toString());
    } catch (e) {
      Dialouge_Box.show_snackBarError(
          title: "Error", description:"Exception error");
    }
  }




  static Future joinChatService({
    required String name,
    required String password,
  }) async {
    Map<String, String> body = {
      "name": name,
      "password": password,

    };

    var response =
    await client.post(Uri.parse(Api_Url.JOIN_GROUP_Url), body: body, headers: {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    });
    print("response body "+ response.body);
    final requestbody = json.decode(response.body);

    try {
      print("response body try  "+ requestbody.toString());
      if (response.statusCode == 200) {
        print("response body when success"+ requestbody.toString());
        print("API response good api_urls.LOGIN");
        return true;
      } else if (response.statusCode == 401) {
        return Dialouge_Box.show_snackBarError(
            title: "Error", description: "Error");
      } else
        return null;
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e);
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.message.toString());
    } catch (e) {
      Dialouge_Box.show_snackBarError(
          title: "Error", description: requestbody["message"]);
    }
  }



  static Future paymentService({
    required String number,
    required String exp_month,
    required String exp_year,
    required String cvc,
    required String amount,
    required String user_id,
    required String description,
  }) async {
    Map<String, String> body = {
      "number": number,
      "exp_month": exp_month,
      "exp_year": exp_year,
      "cvc": cvc,
      "amount": amount,
      "user_id": user_id,
      "description": description,

    };

    var response =
    await client.post(Uri.parse(Api_Url.JOIN_GROUP_Url), body: body, headers: {
      'Authorization': "Bearer " +
          Get.find<GetSTorageController>()
              .getloginModel()!
              .data!
              .apiToken
              .toString()
    });
    print("response body "+ response.body);
    final requestbody = json.decode(response.body);

    try {
      print("response body try  "+ requestbody.toString());
      if (response.statusCode == 200) {
        print("response body when success"+ requestbody.toString());
        print("API response good api_urls.LOGIN");
        return true;
      } else if (response.statusCode == 401) {
        return Dialouge_Box.show_snackBarError(
            title: "Error", description: "Error");
      } else
        return null;
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e);
      Dialouge_Box.show_snackBarError(
          title: "Error", description: e.message.toString());
    } catch (e) {
      Dialouge_Box.show_snackBarError(
          title: "Error", description: requestbody["message"]);
    }
  }

}
