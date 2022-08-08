// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/cari_rekomendasi/bindings/cari_rekomendasi_binding.dart';
import '../modules/cari_rekomendasi/views/cari_rekomendasi_view.dart';
import '../modules/hasil_rekomendasi/bindings/hasil_rekomendasi_binding.dart';
import '../modules/hasil_rekomendasi/views/hasil_rekomendasi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/katalog/bindings/katalog_binding.dart';
import '../modules/katalog/views/katalog_view.dart';
import '../modules/profile_store/bindings/profile_store_binding.dart';
import '../modules/profile_store/views/profile_store_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CARI_REKOMENDASI,
      page: () => const CariRekomendasiView(),
      binding: CariRekomendasiBinding(),
    ),
    GetPage(
      name: _Paths.HASIL_REKOMENDASI,
      page: () => HasilRekomendasiView(),
      binding: HasilRekomendasiBinding(),
    ),
    GetPage(
      name: _Paths.KATALOG,
      page: () => const KatalogView(),
      binding: KatalogBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_STORE,
      page: () => ProfileStoreView(),
      binding: ProfileStoreBinding(),
    ),
  ];
}
