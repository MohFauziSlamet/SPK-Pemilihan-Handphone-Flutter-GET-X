// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class AllListValueData extends GetxController {
  /// ========= memasukan data value harga kedalam list =========
  List<int> valueHarga = [];
  List<int> dataTerkecilHarga = []; // index ke 0, terkecil
  void ambilDataHarga({
    required double harga,
  }) {
    if (harga == 1.5 || harga < 2.0) {
      valueHarga.add(4);
    } else if (harga == 2.0 || harga < 2.5) {
      valueHarga.add(3);
    } else if (harga == 2.5 || harga < 3.0) {
      valueHarga.add(2);
    } else if (harga >= 3.0) {
      valueHarga.add(1);
    }
  }

  void valueHargaTerkecil() {
    dataTerkecilHarga.addAll(valueHarga);
    dataTerkecilHarga.sort();
  }

  /// ========= memasukan data value ram kedalam list =========
  List<int> valueRam = [];
  List<int> dataTerbesarRam = [];
  void ambilDataRam({
    required int ram,
  }) {
    if (ram == 4) {
      valueRam.add(1);
    } else if (ram == 6) {
      valueRam.add(2);
    } else if (ram == 8) {
      valueRam.add(3);
    } else if (ram == 12) {
      valueRam.add(4);
    }
  }

  void valueRamTerbesar() {
    dataTerbesarRam.addAll(valueRam);
    dataTerbesarRam.sort((a, b) => b - a);
  }

  /// ========= memasukan data value rom kedalam list =========
  List<int> valueRom = [];
  List<int> dataTerbesarRom = [];
  void ambilDataRom({
    required int rom,
  }) {
    if (rom == 32) {
      valueRom.add(1);
    } else if (rom == 64) {
      valueRom.add(2);
    } else if (rom == 128) {
      valueRom.add(3);
    } else if (rom == 256) {
      valueRom.add(4);
    }
  }

  void valueRomTerbesar() {
    dataTerbesarRom.addAll(valueRom);
    dataTerbesarRom.sort((a, b) => b - a);
  }

  /// ========= memasukan data value camera kedalam list =========
  List<int> dataTerbesarCamera = [];
  List<int> valueCamera = [];
  void ambilDataCamera({
    required int Camera,
  }) {
    if (Camera == 8 || Camera == 13) {
      valueCamera.add(1);
    } else if (Camera == 48) {
      valueCamera.add(2);
    } else if (Camera == 50) {
      valueCamera.add(3);
    } else if (Camera == 64) {
      valueCamera.add(4);
    }
  }

  void valueCameraTerbesar() {
    dataTerbesarCamera.addAll(valueCamera);
    dataTerbesarCamera.sort((a, b) => b - a);
  }

  /// ========= memasukan data value batrai kedalam list =========
  List<int> dataTerbesarBatrai = [];
  List<int> valueBatrai = [];
  void ambilDataBatrai({
    required int Batrai,
  }) {
    if (Batrai == 4000) {
      valueBatrai.add(1);
    } else if (Batrai == 5000) {
      valueBatrai.add(2);
    } else if (Batrai == 6000) {
      valueBatrai.add(3);
    } else if (Batrai == 7000) {
      valueBatrai.add(4);
    }
  }

  void valueBatraiTerbesar() {
    dataTerbesarBatrai.addAll(valueBatrai);
    dataTerbesarBatrai.sort((a, b) => b - a);
  }
}
