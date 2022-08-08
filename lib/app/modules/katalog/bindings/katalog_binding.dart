import 'package:get/get.dart';

import '../controllers/katalog_controller.dart';

class KatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KatalogController>(
      () => KatalogController(),
    );
  }
}
