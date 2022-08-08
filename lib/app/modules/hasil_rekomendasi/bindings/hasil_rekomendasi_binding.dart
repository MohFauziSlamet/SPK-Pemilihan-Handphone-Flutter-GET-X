import 'package:get/get.dart';

import '../controllers/hasil_rekomendasi_controller.dart';

class HasilRekomendasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilRekomendasiController>(
      () => HasilRekomendasiController(),
    );
  }
}
