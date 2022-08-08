import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/modules/cari_rekomendasi/controllers/cari_rekomendasi_controller.dart';
import '/app/modules/katalog/widget_tambahan/detail.dart';
import '/app/modules/katalog/widget_tambahan/image.dart';
import '/app/modules/widget%20tambahan/customButton.dart';
import '/app/modules/widget%20tambahan/empity_page.dart';
import '/app/routes/app_pages.dart';

import '../controllers/hasil_rekomendasi_controller.dart';

class HasilRekomendasiView extends GetView<HasilRekomendasiController> {
  final dataHp = Get.put(CariRekomendasiController());
  CarouselController carouselController = CarouselController();

  double tinggiBox = Get.height * 0.3;
  double lebarBor = Get.width - 56;
  RxInt _current = 0.obs;

  HasilRekomendasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// proses cek debbug
    print(" ===== Data Hp Sesudah di sort =====");
    dataHp.dataHpFinalSawSort.forEach((element) {
      print("Nama : ${element['nama']} , hasil : ${element['result']} ");
    });

    ///

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text('Hasil Rekomendasi'),
        centerTitle: true,
      ),
      body: (dataHp.dataHpFinalSawSort.isNotEmpty)
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: tinggiBox,
                childAspectRatio: 1,
                // jumlah  kolom grid view
                crossAxisCount: 1,
              ),
              itemCount: dataHp.dataHpFinalSawSort.length,
              itemBuilder: (context, index) {
                var data = dataHp.dataHpFinalSawSort[index];
                // print("isi data $data");
                return Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: lebarBor * 0.3,
                          // color: Colors.amber,
                          child: ImageSlideCarousel(
                            context: context,
                            imageUrl_1: data['imageUrl_1'],
                            imageUrl_2: data['imageUrl_2'],
                            imageUrl_3: data['imageUrl_3'],
                            carouselController: carouselController,
                            currentIndex: _current,
                            onPageChanged: (index, reason) {
                              _current = index.toInt().obs;
                            },
                          ),
                        ),
                        Container(
                          width: lebarBor * 0.7,
                          // color: Colors.green,
                          child: DetailSpesifikasi(
                            nama: data['nama'].toString(),
                            ram: data['ram'].toString(),
                            rom: data['rom'].toString(),
                            batrai: data['batrai'].toString(),
                            camera: data['camera'].toString(),
                            harga: data['harga'].toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Maaf belum ada rekomendasi untuk kamu...',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  Empity(
                    context: context,
                    imageUrl_1: 'assets/lottie/98124-empty.json',
                    imageUrl_2:
                        'assets/lottie/26581-customer-support-icon.json',
                    imageUrl_3: 'assets/lottie/89832-empty-list.json',
                    carouselController: carouselController,
                  ),
                  SizedBox(height: 30),
                  buttonConfirm(() {
                    Get.toNamed(Routes.CARI_REKOMENDASI);
                  }, 'Ayo Cari Handphone Favorit Kamu'),
                ],
              ),
            ),
      floatingActionButton: (dataHp.dataHpFinalSawSort.isEmpty)
          ? FloatingActionButton(
              onPressed: () {
                Get.toNamed(Routes.CARI_REKOMENDASI);
                if (dataHp.dataHpFinalSawSort.isNotEmpty) {
                  dataHp.dataHpFinalSawSort.clear();
                } else {}
              },
              child: Icon(Icons.search_rounded),
            )
          : FloatingActionButton(
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
              child: Icon(Icons.home),
            ),
    );
  }
}
