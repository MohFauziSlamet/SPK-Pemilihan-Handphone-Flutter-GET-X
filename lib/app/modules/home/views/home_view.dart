import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/modules/widget%20tambahan/box_transparant.dart';
import '/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat datang Di Tiga Putra Store '),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          /// BACKGROUND
          SizedBox(
            height: Get.height * 0.5,
            child: const Image(
              image: AssetImage("assets/images/bgHp.jpeg"),
              fit: BoxFit.cover,
            ),
          ),

          /// ISI DARI 4 BUTTON
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 40,
                ),
                children: [
                  /// BUTTON CARI REKOMENDASI
                  boxTransparants(
                    imageUrl: "assets/images/search.png",
                    imageDeskription: 'Cari Rekomendasi',
                    function: () {
                      Get.toNamed(Routes.CARI_REKOMENDASI);
                    },
                  ),
                  const SizedBox(height: 20),

                  /// BUTTON HASIL PENCARIAN
                  boxTransparants(
                    imageUrl: "assets/images/new-complain.png",
                    imageDeskription: 'Hasil Pencarian',
                    function: () {
                      Get.toNamed(Routes.HASIL_REKOMENDASI);
                    },
                  ),
                  const SizedBox(height: 20),

                  /// BUTTON KATALOG HP
                  boxTransparants(
                    imageUrl: "assets/images/checklist.png",
                    imageDeskription: 'Katalog Hp',
                    function: () {
                      Get.toNamed(Routes.KATALOG);
                    },
                  ),
                  const SizedBox(height: 20),

                  /// BUTTON PROFILE STORE
                  boxTransparants(
                    imageUrl: "assets/images/shop.png",
                    imageDeskription: 'Profile Store',
                    function: () {
                      Get.toNamed(Routes.PROFILE_STORE);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
