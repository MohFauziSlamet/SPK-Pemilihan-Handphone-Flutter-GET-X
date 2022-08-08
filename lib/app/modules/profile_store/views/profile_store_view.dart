import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_store_controller.dart';

class ProfileStoreView extends GetView<ProfileStoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Store '),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            child: Image(
              image: AssetImage("assets/images/profile.jpg"),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    "Tiga Putra Kepanjen Store",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Salah satu pusat perbelanjaan elektronik Handphone terbesar di kabupaten kepanjen.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Jl. A. Yani No.14, Ardirejo, Kepanjen, Ardirejo, Kec. Kepanjen, Kab. Malang, Jawa Timur 65163, Indonesia',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: AssetImage("assets/images/wa.png"),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "081131119090",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[200],
                            backgroundImage:
                                AssetImage("assets/images/Instagram.png"),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "tigaputra_hp",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: AssetImage('assets/images/fb.png'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Tigaputra Kepanjen",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


// +62 811-3111-9090
// 