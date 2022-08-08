import 'package:get/get.dart';

import '../controllers/profile_store_controller.dart';

class ProfileStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileStoreController>(
      () => ProfileStoreController(),
    );
  }
}
