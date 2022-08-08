import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buttonConfirm(void Function()? onPressed, String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Center(
      child: Container(
        width: Get.width * 0.8,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 17, letterSpacing: 4),
            textAlign: TextAlign.center,
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    ),
  );
}
