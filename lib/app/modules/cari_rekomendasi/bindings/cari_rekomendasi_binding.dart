import 'package:get/get.dart';

import '../controllers/cari_rekomendasi_controller.dart';

class CariRekomendasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CariRekomendasiController>(
      () => CariRekomendasiController(),
    );
  }
}
