import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/modules/katalog/widget_tambahan/detail.dart';
import '/app/modules/katalog/widget_tambahan/image.dart';

import '../controllers/katalog_controller.dart';

class KatalogView extends StatefulWidget {
  const KatalogView({Key? key}) : super(key: key);

  @override
  State<KatalogView> createState() => _KatalogViewState();
}

class _KatalogViewState extends State<KatalogView> {
  final controller = Get.find<KatalogController>();
  CarouselController carouselController = CarouselController();

  double tinggiBox = Get.height * 0.3;
  double lebarBor = Get.width - 56;
  RxInt _current = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Koleksi Handphone'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamGetData(),
        builder: (contrxt, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var getDataAll = snapshot.data!.docs;

            // ignore: prefer_is_empty
            if (getDataAll.length != 0) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: tinggiBox,
                  childAspectRatio: 1,
                  // jumlah  kolom grid view
                  crossAxisCount: 1,
                ),
                itemCount: getDataAll.length,
                itemBuilder: (context, index) {
                  var data = getDataAll[index].data() as Map<String, dynamic>;

                  return Container(
                    margin: const EdgeInsets.only(
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
                          SizedBox(
                            width: lebarBor * 0.3,
                            // color: Colors.amber,
                            child: ImageSlideCarousel(
                              context: context,
                              imageUrl_1: data['imageUrl-1'],
                              imageUrl_2: data['imageUrl-2'],
                              imageUrl_3: data['imageUrl-3'],
                              carouselController: carouselController,
                              currentIndex: _current,
                              onPageChanged: (index, reason) {
                                _current = index.toInt().obs;
                              },
                            ),
                          ),
                          SizedBox(
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
              );
            } else {
              return const Center(
                child: Text(
                  "Belum Ada Data",
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
          }

          /// selain connectionState.active
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                color: Color(0xFFFF4891),
              ),
            ),
          );
        },
      ),
    );
  }
}
