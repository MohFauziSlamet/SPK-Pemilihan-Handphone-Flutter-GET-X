import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget boxTransparants(
    {String? imageUrl,
    String? imageDeskription,
    required void Function() function}) {
  double lebarBox = Get.width * 0.5;
  double tinggiBox = Get.width * 0.2;
  return Material(
    elevation: 7,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    child: InkWell(
      splashColor: Colors.amber,
      onTap: function,
      borderRadius: BorderRadius.circular(25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            width: lebarBox,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.4),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: lebarBox * 0.7,
                height: tinggiBox * 0.55,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(imageUrl!),
                    ),
                    SizedBox(
                      width: lebarBox * 0.9,
                      child: Text(
                        imageDeskription!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
