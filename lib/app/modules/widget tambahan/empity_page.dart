import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Widget Empity({
  required BuildContext context,
  required String imageUrl_1,
  required String imageUrl_2,
  required String imageUrl_3,
  required CarouselController carouselController,
}) {
  double tinggiBox = Get.height * 0.3;
  double tinggiImage = tinggiBox * 0.8;

  List<Widget> imageSliders = [
    Container(
      height: tinggiImage * 0.75,
      width: Get.width * 0.7,
      margin: EdgeInsets.only(left: 10),
      child: Lottie.asset(imageUrl_1),
    ),
    Container(
      height: tinggiImage * 0.75,
      margin: EdgeInsets.only(left: 10),
      child: Lottie.asset(imageUrl_2),
    ),
    Container(
      height: tinggiImage * 0.75,
      margin: EdgeInsets.only(left: 10),
      child: Lottie.asset(imageUrl_3),
    ),
  ];

  return BackdropFilter(
    filter: ImageFilter.blur(),
    child: Container(
      height: tinggiImage,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: CarouselSlider(
        items: imageSliders,
        carouselController: carouselController,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          // aspectRatio: 1.0,
          scrollDirection: Axis.horizontal,
        ),
      ),
    ),
  );
}
