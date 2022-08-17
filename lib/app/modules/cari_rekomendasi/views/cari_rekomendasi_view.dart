import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/widget%20tambahan/DropdownMenuButtonKriteria.dart';
import '/app/modules/widget%20tambahan/customButton.dart';
import '/app/routes/app_pages.dart';

import '../controllers/cari_rekomendasi_controller.dart';

class CariRekomendasiView extends GetView<CariRekomendasiController> {
  const CariRekomendasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Rekomendasi'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.streamGetData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var getDataAll = snapshot.data!.docs;

              /// PROSES MEMASUKAN DATA DARI DATABASE KE LOCAL
              for (var index = 0; index < getDataAll.length; index++) {
                var data = getDataAll[index].data() as Map<String, dynamic>;
                controller.memasukanDataKeList(
                  nama: data['nama'],
                  harga: data['harga'],
                  ram: data['ram'],
                  rom: data['rom'],
                  camera: data['camera'],
                  batrai: data['batrai'],
                  imageUrl_1: data['imageUrl-1'],
                  imageUrl_2: data['imageUrl-2'],
                  imageUrl_3: data['imageUrl-3'],
                  index: index,
                );
                // print("looping ke $index");
              }
            }

            return Stack(
              children: [
                /// BACKGROUND
                Container(
                  height: Get.height,
                  child: const Image(
                    image: AssetImage("assets/images/bgHp.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),

                /// CONTENT DROPDONW
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        width: Get.width * 0.9,
                        height: Get.height * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// JUDUL
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, top: 20, right: 20),
                              child: Text(
                                "Silahakan masukan kriteria yang dicari",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            /// DROPDOWN HARGA
                            DropdownMenuButtonKriteria(
                              dataMapping: controller.dataMappingHarga,
                              value: 'harga',
                              detail: 'Harga',
                              nilaiData: controller.BobotPreferensiHarga,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.BobotPreferensiHarga =
                                      value['value'];
                                } else {
                                  controller.BobotPreferensiHarga = 0;
                                }
                              },
                            ),

                            /// DROPDOWN RAM
                            DropdownMenuButtonKriteria(
                              dataMapping: controller.dataMappingRam,
                              value: 'ram',
                              detail: 'Ram',
                              nilaiData: controller.BobotPreferensiRam,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.BobotPreferensiRam =
                                      value['value'];
                                } else {
                                  controller.BobotPreferensiRam = 0;
                                }
                              },
                            ),

                            /// DROPDOWN ROM
                            DropdownMenuButtonKriteria(
                              dataMapping: controller.dataMappingRom,
                              value: 'rom',
                              detail: 'Penyimpanan',
                              nilaiData: controller.BobotPreferensiRom,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.BobotPreferensiRom =
                                      value['value'];
                                } else {
                                  controller.BobotPreferensiRom = 0;
                                }
                              },
                            ),

                            /// DROPDOWN CAMERA
                            DropdownMenuButtonKriteria(
                              dataMapping: controller.dataMappingCamera,
                              value: 'camera',
                              detail: 'Camera',
                              nilaiData: controller.BobotPreferensiCamera,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.BobotPreferensiCamera =
                                      value['value'];
                                } else {
                                  controller.BobotPreferensiCamera = 0;
                                }
                              },
                            ),

                            /// DROPDOWN BATRAI
                            DropdownMenuButtonKriteria(
                              dataMapping: controller.dataMappingBatrai,
                              value: 'batrai',
                              detail: 'Batrai',
                              nilaiData: controller.BobotPreferensiBatrai,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.BobotPreferensiBatrai =
                                      value['value'];
                                } else {
                                  controller.BobotPreferensiBatrai = 0;
                                }
                              },
                            ),

                            /// BUTTON CARI
                            buttonConfirm(
                              () {
                                // controller.tampil();
                                controller.tampilDataHp();
                                Get.defaultDialog(
                                    title: 'Sukses',
                                    middleText:
                                        'Kami sudah mencarikan kamu handphone yang recomended',
                                    onConfirm: () {
                                      Get.toNamed(Routes.HASIL_REKOMENDASI);
                                    },
                                    textConfirm: 'Yuk dilihat :)');
                              },
                              "Cari",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
