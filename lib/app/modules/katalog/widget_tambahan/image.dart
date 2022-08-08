import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget ImageSlideCarousel(
    {required BuildContext context,
    required String imageUrl_1,
    required String imageUrl_2,
    required String imageUrl_3,
    required RxInt currentIndex,
    required CarouselController carouselController,
    dynamic Function(int, CarouselPageChangedReason)? onPageChanged}) {
  double tinggiBox = Get.height * 0.3;
  double tinggiImage = tinggiBox * 0.8;

  List<Widget> imageSliders = [
    Container(
      height: tinggiImage * 0.75,
      margin: EdgeInsets.only(left: 10),
      child: Image(
        image: NetworkImage(imageUrl_1),
        fit: BoxFit.cover,
      ),
    ),
    Container(
      height: tinggiImage * 0.75,
      margin: EdgeInsets.only(left: 10),
      child: Image(
        image: NetworkImage(imageUrl_2),
        fit: BoxFit.cover,
      ),
    ),
    Container(
      height: tinggiImage * 0.75,
      margin: EdgeInsets.only(left: 10),
      child: Image(
        image: NetworkImage(imageUrl_3),
        fit: BoxFit.cover,
      ),
    ),
  ];

  return BackdropFilter(
    filter: ImageFilter.blur(),
    child: Container(
      height: tinggiImage,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: CarouselSlider(
        items: imageSliders,
        carouselController: carouselController,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          // aspectRatio: 1.0,
          scrollDirection: Axis.vertical,
          onPageChanged: onPageChanged,
        ),
      ),
    ),
  );
}
