import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/GetStorage/get_storage_controller.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/models/leaderboard_model.dart';

import '../../../models/daily_goals_model.dart';
import '../../../utils/colors.dart';
import '../../chat_list/controller/group_chat_controller.dart';
import '../../home/screens/daily_goals/view/user_detailes.dart';

class ChatScreen extends StatefulWidget {
  final itemIndex;

  // var image;
  // var title;
  ChatScreen({Key? key, required this.itemIndex}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final groupChatController = Get.put(GroupChatController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    groupChatController.groupMessagesData(
        gp_id: widget.itemIndex.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    log("user id " + widget.itemIndex.userId.toString());
    String User_id=Get.find<GetSTorageController>().getloginModel()!.data!.id.toString();
    log("current user id " +
     Get.find<GetSTorageController>().getloginModel()!.data!.id.toString());
    log("group id" + widget.itemIndex.id.toString());
    return Scaffold(
      backgroundColor: AppColors.cPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 40,
                )),
            SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => UserDetailes(
                        image: widget.itemIndex.image,
                        title: widget.itemIndex.name_title,
                      ));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.itemIndex.image == null
                      ? Get.find<GetSTorageController>()
                          .getloginModel()!
                          .data!
                          .image
                          .toString()
                      : widget.itemIndex.image),
                )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemIndex.name,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.whitekColor,
                  ),
                ),
                Text(
                  "${widget.itemIndex.memberAmount.toString()} members",
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: AppColors.cPrimaryColor,
                  ),
                ),
              ],
            ),
            // ListTile(
            //   // leading: CircleAvatar(backgroundImage: AssetImage("assets/daily_goals_image/fitness.png"),),
            //   title: ,
            //   subtitle:
            // ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.blackColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(() {
                        if (groupChatController.isLoadingMessage.value) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (groupChatController
                                .modelMesages.value.data!.length ==
                            0) {
                          log("empty");
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 180),
                              child: Text("No Order Found",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black)),
                            ),
                          );
                        }
                        if (groupChatController.isEmptyMessage.value) {
                          log("empty");
                          return Center(
                            child: Text("No Order Found",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          );
                        }

                        return GestureDetector(
                          onTap: () {
                            print("data here:" +
                                groupChatController
                                    .modelMesages.value.data!.length
                                    .toString());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 1.3,
                            // padding: EdgeInsets.symmetric(horizontal: 30),
                            child: ListView.builder(
                                controller:
                                    groupChatController.scrollController,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: groupChatController
                                    .modelMesages.value.data!.length,
                                itemBuilder: (context, index) {
                                  var items = groupChatController
                                      .modelMesages.value.data![index];
                                  log("sender id" + items.senderId.toString());
                                  groupChatController.update();
                                  return GestureDetector(
                                    onTap: (){
                                      print("Object Id daara: "+groupChatController
                                          .modelMesages.value.data![index].senderId.toString());
                                    },
                                    child: items.senderId.toString() !=
                                        User_id
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                // width: MediaQuery.of(context).size.width,
                                                // height: MediaQuery.of(context).size.height*0.43,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 10),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 5),

                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey,
                                                  // image: DecorationImage(image: NetworkImage(items.image.toString(),),fit: BoxFit.fill,)
                                                ),
                                                child: Text(
                                                  items.message.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                // width: MediaQuery.of(context).size.width,
                                                // height: MediaQuery.of(context).size.height*0.43,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 10),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue,
                                                  // image: DecorationImage(image: NetworkImage(items.image.toString(),),fit: BoxFit.fill,)
                                                ),
                                                child: Text(
                                                  items.message.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                  );
                                }),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Container(
                color: AppColors.cPrimaryColor,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff57E3B0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: groupChatController.sendMessageController,
                        maxLines: null,
                        style: TextStyle(color: AppColors.whitekColor),
                        decoration: InputDecoration(
                            hintText: "Your message",
                            helperStyle: TextStyle(color: Colors.white),
                            suffix: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.asset(
                                ImageConstant.suffix,
                                height: 20,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10)),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    // Obx(() =>
                    //
                    // groupChatController.isLoading.value?Center(child: CircularProgressIndicator(),):
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: AppColors.blackColor,
                    //       borderRadius: BorderRadius.circular(10)
                    //   ),
                    //   child:
                    //   IconButton(
                    //       onPressed: () {
                    //         groupChatController.sendMessage(
                    //             group_id: widget.itemIndex.id.toString(),
                    //             message: groupChatController.sendMessageController.value.text,
                    //           sender_id: widget.itemIndex.userId.toString()
                    //         );
                    //       },
                    //       icon: Icon(
                    //         Icons.send,
                    //         color: AppColors.whitekColor,
                    //       )),
                    // ))

                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            // Add a new item to the list
//                            myList.add(newItem);

// Scroll the ListView to its last index
                            print("Sender ID: " +
                                widget.itemIndex.userId.toString());

                            groupChatController.sendMessage(
                                group_id: widget.itemIndex.id.toString(),
                                message: groupChatController
                                    .sendMessageController.value.text,
                                sender_id: User_id);
                            groupChatController.update();
                            // setState(() {
                            //   groupChatController.scrollController.animateTo(
                            //     _scrollController.position.maxScrollExtent,
                            //     duration: Duration(milliseconds: 500),
                            //     curve: Curves.easeOut,
                            //   );

                            //                        });
                          },
                          icon: Icon(
                            Icons.send,
                            color: AppColors.whitekColor,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
