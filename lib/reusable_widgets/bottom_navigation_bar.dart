import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/screen/add_logo/view/add_logo_screen.dart';
import 'package:improvescap/screen/home/screens/daily_goals/view/daily_screen_view.dart';
import 'package:improvescap/utils/colors.dart';
import '../screen/chat_list/view/chat_list.dart';
import '../screen/home/view/home_screen.dart';
import '../screen/leadership/view/leadership_screen.dart';
import '../screen/setting/view/view.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int? index;
  CustomBottomNavBar({ this.index = 0});
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}
class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  PageController? _pageController;
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(
        child: CustomNavigationBar(
            iconSize: Get.height*0.04,
            selectedColor:Colors.white,
            unSelectedColor:AppColors.whitekColor,
            backgroundColor: AppColors.cPrimaryColor,
            items: [
              CustomNavigationBarItem(
                icon: InkWell(
                  onTap: (){
                    Get.offAll(()=>ChatList());
                  },
                  child: Image.asset(ImageConstant.message_icon,
                    color:widget.index==0? Colors.white: AppColors.whitekColor,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: InkWell(
                  onTap: (){
                    Get.offAll(()=>DailyGoals());

                  },
                  child: Image.asset(ImageConstant.search_icon,
                    color:widget.index==1? Colors.white: AppColors.whitekColor,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: InkWell(
                  onTap: (){
                    Get.to(()=>HomeScreen());
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: AppColors.whitekColor,
                      borderRadius: BorderRadius.circular(200)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(ImageConstant.home_icon,
                        color:widget.index==2? AppColors.cPrimaryColor: AppColors.cPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: InkWell(
                  onTap: (){
                    Get.offAll(()=>LeaderShipScreen());
                  },
                  child: Image.asset(ImageConstant.cup_icon,
                    color:widget.index==3? AppColors.whitekColor: AppColors.whitekColor,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: InkWell(
                  onTap: (){
                    Get.offAll(()=>SettingScreen());
                  },
                  child: Image.asset(ImageConstant.setting_icon,
                    color:widget.index==4? Colors.white: AppColors.whitekColor,
                  ),
                ),
              ),
            ],
            currentIndex: widget.index??_selectedIndex,
            onTap: (index) {
              _selectedIndex = index;
              _pageController?.animateToPage(
                  index, duration: Duration(milliseconds: 1), curve: Curves.ease);
            }
        ),
      );
  }
}