import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/colors.dart';

List<String> imageList = [
  'assets/home_image/scroll_image.png',
  'assets/home_image/scroll_image.png',
  'assets/home_image/scroll_image.png',
  'assets/home_image/scroll_image.png',
  'assets/home_image/scroll_image.png',

];


class HomeScreenComponent{
  buildContainer({required String text,required Color color,required final onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:20,top: 17),
          child: Text(text,style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.whitekColor,
          ),),
        ),
      ),
    );
  }
}
class CustomeCarouselHomePage extends StatefulWidget {
  final List<String> items ;

  CustomeCarouselHomePage({ required this.items});

  @override
  _CustomeCarouselHomePageState createState() =>
      _CustomeCarouselHomePageState();
}
class _CustomeCarouselHomePageState extends State<CustomeCarouselHomePage> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height*0.35,
          aspectRatio: 2.0,
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(seconds: 4),
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//          enlargeCenterPage: true,
          onPageChanged: (index,reason) {
            setActiveDot(index);
          },          scrollDirection: Axis.horizontal,
        ),
        items: widget.items.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.43,
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        image: DecorationImage(image: AssetImage(item.toString(),),fit: BoxFit.fill,)
                    ),

                  ),

                ],
              );
            },
          );
        }).toList(),
      ),

    ],
    );
  }
}






