import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget DetailSpesifikasi({
  required String nama,
  required String ram,
  required String rom,
  required String batrai,
  required String camera,
  required String harga,
}) {
  double tinggiBox = Get.height * 0.3;
  double tinggiImage = tinggiBox * 0.8;

  return BackdropFilter(
    filter: ImageFilter.blur(),
    child: Container(
      height: tinggiImage,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama : $nama",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Ram : $ram GB",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Rom : $rom GB",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Batrai : $batrai MAH",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Camera : $camera MP",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Harga : Rp. $harga.000 ',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    ),
  );
}
