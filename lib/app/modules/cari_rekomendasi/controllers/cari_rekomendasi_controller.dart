// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '/app/modules/cari_rekomendasi/controllers/list_data.dart';

class CariRekomendasiController extends GetxController {
  /// variabel untuk input konsumen
  int BobotPreferensiHarga = 0;
  int BobotPreferensiRam = 0;
  int BobotPreferensiRom = 0;
  int BobotPreferensiCamera = 0;
  int BobotPreferensiBatrai = 0;

  // int? tampil() {
  //   print("menampilkan harga di controller $harga");
  //   print("menampilkan ram di controller $ram");
  //   print("menampilkan rom di controller $rom");
  //   print("menampilkan camera di controller $camera");
  //   print("menampilkan batrai di controller $batrai");
  // }

  /// membuat list of mapping <String , dynamic> untuk harga
  List<Map<String, dynamic>> dataMappingHarga = [
    {
      'harga': 'Harga Rp.1.5 Jt - Rp. 2 Jt',
      'value': 1,
    },
    {
      'harga': 'Harga Rp.2 Jt - Rp. 2.5 Jt',
      'value': 2,
    },
    {
      'harga': 'Harga Rp.2.5 Jt - Rp. 3 Jt',
      'value': 3,
    },
    {
      'harga': 'Harga Rp.3 Jt keatas',
      'value': 4,
    },
  ];

  /// membuat list of mapping <String , dynamic> untuk harga
  List<Map<String, dynamic>> dataMappingRam = [
    {
      'ram': 'Ram 4',
      'value': 1,
    },
    {
      'ram': 'Ram 6',
      'value': 2,
    },
    {
      'ram': 'Ram 8',
      'value': 3,
    },
    {
      'ram': 'Ram 12',
      'value': 4,
    },
  ];

  /// membuat list of mapping <String , dynamic> untuk harga
  List<Map<String, dynamic>> dataMappingRom = [
    {
      'rom': 'Penyimpanan internal 32',
      'value': 1,
    },
    {
      'rom': 'Penyimpanan internal 64',
      'value': 2,
    },
    {
      'rom': 'Penyimpanan internal 128',
      'value': 3,
    },
    {
      'rom': 'Penyimpanan internal 256',
      'value': 4,
    },
  ];

  /// membuat list of mapping <String , dynamic> untuk harga
  List<Map<String, dynamic>> dataMappingCamera = [
    {
      'camera': 'Camera 8 - 13 MP',
      'value': 1,
    },
    {
      'camera': 'Camera 48 MP',
      'value': 2,
    },
    {
      'camera': 'Camera 50 MP',
      'value': 3,
    },
    {
      'camera': 'Camera 64 MP',
      'value': 4,
    },
  ];

  /// membuat list of mapping <String , dynamic> untuk harga
  List<Map<String, dynamic>> dataMappingBatrai = [
    {
      'batrai': 'Batrai 4000 MAH',
      'value': 1,
    },
    {
      'batrai': 'Batrai 5000 MAH',
      'value': 2,
    },
    {
      'batrai': 'Batrai 6000 MAH',
      'value': 3,
    },
    {
      'batrai': 'Batrai 7000 MAH',
      'value': 4,
    },
  ];

  /// ===========================================================================
  /// inisiasi awal cloud_firestore.
  /// sebelum menggunakan ini , ada dua yang harus di inisiasi, yaitu
  /// inisiasi firebase lalu firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// data akan dipantau secara real time
  /// sehingga ketika ada perubahan , pada database . akan langsung kedeteksi oleh aplikasi
  Stream<QuerySnapshot<Object?>> streamGetData() async* {
    CollectionReference productHp = firestore.collection("data-hp");

    yield* productHp.snapshots();
  }

  /// ========= memasukan data menjadi list of mapping =========
  List<Map<String, dynamic>> dataHp = [];
  void memasukanDataKeList({
    required String nama,
    required double harga,
    required int ram,
    required int rom,
    required int index,
    required int camera,
    required int batrai,
    required String imageUrl_1,
    required String imageUrl_2,
    required String imageUrl_3,
  }) {
    dataHp.add({
      'nama': nama,
      'harga': harga,
      'ram': ram,
      'rom': rom,
      'camera': camera,
      'batrai': batrai,
      'imageUrl_1': imageUrl_1,
      'imageUrl_2': imageUrl_2,
      'imageUrl_3': imageUrl_3,
      'result': 0.0,
    });
  }

  /// ==========================================================================
  final data = Get.put(AllListValueData());

  /// ===== normalisasi C1 Harga =====
  List<double> normalisasiC1Harga() {
    List<double> c1Harga = [];
    for (var i = 0; i < data.valueHarga.length; i++) {
      c1Harga.add(data.dataTerkecilHarga[0] / data.valueHarga[i]);
    }
    // print("Isi c1Harga : $c1Harga"); // isi normalisasi c1Harga

    // print("data normalisasi c1 ");
    return c1Harga;
  }

  List<double> perkalianDenganBobotpreferensiHarga(
      {required List<double> dataC1}) {
    List<double> hasilPerkalianBpHarga = [];

    /// mengalikan tiap index dengan BobotPreferensiRam
    for (var i = 0; i < dataC1.length; i++) {
      hasilPerkalianBpHarga.add(dataC1[i] * BobotPreferensiHarga);
    }

    return hasilPerkalianBpHarga;
  }

  //----------------------------------------------------------------------------

  /// ===== normalisasi C2 Ram =====
  List<double> normalisasiC2Ram() {
    List<double> c2Ram = [];
    for (var i = 0; i < data.valueRam.length; i++) {
      c2Ram.add(data.valueRam[i] / data.dataTerbesarRam[0]);
    }
    // print("Isi c1Harga : $c1Harga"); // isi normalisasi c1Harga

    // print("data normalisasi c1 ");
    return c2Ram;
  }

  List<double> perkalianDenganBobotpreferensiRam(
      {required List<double> dataC2}) {
    List<double> hasilPerkalianBpRam = [];

    /// mengalikan tiap index dengan BobotPreferensiRam
    for (var i = 0; i < dataC2.length; i++) {
      hasilPerkalianBpRam.add(dataC2[i] * BobotPreferensiRam);
    }

    return hasilPerkalianBpRam;
  }

  //----------------------------------------------------------------------------

  /// ===== normalisasi C3 Rom =====
  List<double> normalisasiC3Rom() {
    List<double> c3Rom = [];
    for (var i = 0; i < data.valueRom.length; i++) {
      c3Rom.add(data.valueRom[i] / data.dataTerbesarRom[0]);
    }
    // print("Isi c1Harga : $c1Harga"); // isi normalisasi c1Harga

    // print("data normalisasi c1 ");
    return c3Rom;
  }

  List<double> perkalianDenganBobotpreferensiRom(
      {required List<double> dataC3}) {
    List<double> hasilPerkalianBpRom = [];

    /// mengalikan tiap index dengan BobotPreferensiRam
    for (var i = 0; i < dataC3.length; i++) {
      hasilPerkalianBpRom.add(dataC3[i] * BobotPreferensiRom);
    }

    return hasilPerkalianBpRom;
  }

  //----------------------------------------------------------------------------

  /// ===== normalisasi C4 camera =====
  List<double> normalisasiC4Camera() {
    List<double> c4Camera = [];
    for (var i = 0; i < data.valueCamera.length; i++) {
      c4Camera.add(data.valueCamera[i] / data.dataTerbesarCamera[0]);
    }
    // print("Isi c1Harga : $c1Harga"); // isi normalisasi c1Harga

    // print("data normalisasi c1 ");
    return c4Camera;
  }

  List<double> perkalianDenganBobotpreferensiCamera(
      {required List<double> dataC4}) {
    List<double> hasilPerkalianBpCamera = [];

    /// mengalikan tiap index dengan BobotPreferensiRam
    for (var i = 0; i < dataC4.length; i++) {
      hasilPerkalianBpCamera.add(dataC4[i] * BobotPreferensiCamera);
    }

    return hasilPerkalianBpCamera;
  }

  //----------------------------------------------------------------------------

  /// ===== normalisasi C5 Batrai =====
  List<double> normalisasiC5Batrai() {
    List<double> c5Batrai = [];
    for (var i = 0; i < data.valueBatrai.length; i++) {
      c5Batrai.add(data.valueBatrai[i] / data.dataTerbesarBatrai[0]);
    }
    // print("Isi c1Harga : $c1Harga"); // isi normalisasi c1Harga

    // print("data normalisasi c1 ");
    return c5Batrai;
  }

  List<double> perkalianDenganBobotpreferensiBatrai(
      {required List<double> dataC5}) {
    List<double> hasilPerkalianBpBatrai = [];

    /// mengalikan tiap index dengan BobotPreferensiRam
    for (var i = 0; i < dataC5.length; i++) {
      hasilPerkalianBpBatrai.add(dataC5[i] * BobotPreferensiBatrai);
    }

    return hasilPerkalianBpBatrai;
  }

  //----------------------------------------------------------------------------
  /// menjumlahkan seluruh data dan di tampung pada variabel resultData
  List<double> result({
    required List<double> harga,
    required List<double> ram,
    required List<double> rom,
    required List<double> camera,
    required List<double> batrai,
  }) {
    List<double> resultData = [];
    for (var i = 0; i < harga.length; i++) {
      resultData.add(
        harga[i] + ram[i] + rom[i] + camera[i] + batrai[i],
      );
    }

    return resultData;
  }

  //----------------------------------------------------------------------------
  /// menjumlahkan seluruh data dan di tampung pada variabel resultData
  List<Map<String, dynamic>> dataHpSaw(
      {required List<double> dataPenjumlahan}) {
    for (var i = 0; i < dataPenjumlahan.length; i++) {
      dataHp[i]['result'] = dataPenjumlahan[i].ceil();
    }

    return dataHp;
  }

  //----------------------------------------------------------------------------
  List<Map<String, dynamic>> sortDataHp(
      {required List<Map<String, dynamic>> dataHp, required int bobotHarga}) {
    dataHp.sort((a, b) => ((b['result'])) - ((a['result'])));
    return dataHp;
  }

  void tampilDataHp() {
    print("======== Pengambilan Bobot preferensi ======== ");
    print(" Bobot Preferensi Harga : $BobotPreferensiHarga");
    print(" Bobot Preferensi Ram : $BobotPreferensiRam");
    print(" Bobot Preferensi Rom : $BobotPreferensiRom");
    print(" Bobot Preferensi Camera : $BobotPreferensiCamera");
    print(" Bobot Preferensi Batrai : $BobotPreferensiBatrai");
    print("================================================================\n");

    /// -----------------------------------------------------------
    /// mengambil data value harga
    /// dimasukan ke list valueHarga
    for (var i = 0; i < dataHp.length; i++) {
      data.ambilDataHarga(harga: dataHp[i]['harga']);
    }
    print(
        "======== Proses Pemberian nilai pada tiap kriteria dari database ======== ");
    print("isi nilai all data harga : ${data.valueHarga}");

    /// mengambil nilai terkecil harga
    // data.dataTerkecilHarga[0];
    data.valueHargaTerkecil();
    print("isi nilai terkecil data harga : ${data.dataTerkecilHarga[0]}");

    /// -----------------------------------------------------------

    /// mengambil data value ram
    /// dimasukan ke list valueRam
    for (var i = 0; i < dataHp.length; i++) {
      data.ambilDataRam(ram: dataHp[i]['ram']);
    }
    print("isi nilai all data ram : ${data.valueRam}");

    /// mengambil nilai terbesar ram
    // data.dataTerbesar[0];
    data.valueRamTerbesar();
    print("isi nilai terbesar data ram : ${data.dataTerbesarRam[0]}");

    /// -----------------------------------------------------------

    /// mengambil data value rom
    /// dimasukan ke list valueRom
    for (var i = 0; i < dataHp.length; i++) {
      data.ambilDataRom(rom: dataHp[i]['rom']);
    }
    print("isi nilai all data rom : ${data.valueRom}");

    /// mengambil nilai terbesar rom
    // data.dataTerbesar[0];
    data.valueRomTerbesar();
    print("isi nilai terbesar data rom : ${data.dataTerbesarRom[0]}");

    /// -----------------------------------------------------------

    /// mengambil data value camera
    /// dimasukan ke list valueRom
    for (var i = 0; i < dataHp.length; i++) {
      data.ambilDataCamera(Camera: dataHp[i]['camera']);
    }
    print("isi nilai all data camera : ${data.valueCamera}");

    /// mengambil nilai terbesar camera
    // data.dataTerbesar[0];
    data.valueCameraTerbesar();
    print("isi nilai terbesar data rom : ${data.dataTerbesarCamera[0]}");

    /// -----------------------------------------------------------

    /// mengambil data value batrai
    /// dimasukan ke list valueBatrai
    for (var i = 0; i < dataHp.length; i++) {
      data.ambilDataBatrai(Batrai: dataHp[i]['batrai']);
    }
    print("isi nilai all data batrai : ${data.valueBatrai}");

    /// mengambil nilai terbesar batrai
    // data.dataTerbesar[0];
    data.valueBatraiTerbesar();
    print("isi nilai terbesar data rom : ${data.dataTerbesarBatrai[0]}");
    print("================================================================\n");

    /// -------------------------------------------------------------------

    /// ===== normalisasi C1 Harga =====
    normalisasiC1Harga();
    List<double> hasilPerkalianC1 = perkalianDenganBobotpreferensiHarga(
      dataC1: normalisasiC1Harga(),
    );
    // print("hasil perkalian dg BP harga $hasilPerkalianC1");

    /// ===== normalisasi C2 Ram =====
    normalisasiC2Ram();
    List<double> hasilPerkalianC2 = perkalianDenganBobotpreferensiRam(
      dataC2: normalisasiC2Ram(),
    );
    // print("hasil perkalian dg BP ram $hasilPerkalianC2");

    /// ===== normalisasi C3 Rom =====
    normalisasiC3Rom();
    List<double> hasilPerkalianC3 = perkalianDenganBobotpreferensiRom(
      dataC3: normalisasiC3Rom(),
    );
    // print("hasil perkalian dg BP rom $hasilPerkalianC3");

    /// ===== normalisasi C4 Camera =====
    normalisasiC4Camera();
    List<double> hasilPerkalianC4 = perkalianDenganBobotpreferensiCamera(
      dataC4: normalisasiC4Camera(),
    );
    // print("hasil perkalian dg BP camera $hasilPerkalianC4");

    /// ===== normalisasi C5 Batrai =====
    normalisasiC5Batrai();
    List<double> hasilPerkalianC5 = perkalianDenganBobotpreferensiBatrai(
      dataC5: normalisasiC5Batrai(),
    );
    // print("hasil perkalian dg BP batrai $hasilPerkalianC5");

    print(
        "======== Proses normalisasi pada tiap kriteria dari database ======== ");
    print("Normalisasi C1 Harga : ${normalisasiC1Harga()}");
    print("Normalisasi C2 Ram : ${normalisasiC2Ram()}");
    print("Normalisasi C3 Rom : ${normalisasiC3Rom()}");
    print("Normalisasi C4 Camera : ${normalisasiC4Camera()}");
    print("Normalisasi C5 Batrai : ${normalisasiC5Batrai()}");
    print("================================================================\n");

    print(
        "======== Proses pengkalian dengan Bobot Preferensi pada tiap kriteria dari database ======== ");
    print("Hasil Perkalian C1 Harga : $hasilPerkalianC1");
    print("Hasil Perkalian C2 Ram : $hasilPerkalianC2");
    print("Hasil Perkalian C3 Rom : $hasilPerkalianC3");
    print("Hasil Perkalian C4 Camera : $hasilPerkalianC4");
    print("Hasil Perkalian C5 Batrai : $hasilPerkalianC5");
    print("================================================================\n");

    /// -------------------------------------------------------------------
    /// menjumlahkan seluruh data setelah melakukan perkalian
    List<double> hasilPenjulahanAllData = result(
      harga: hasilPerkalianC1,
      ram: hasilPerkalianC2,
      rom: hasilPerkalianC3,
      camera: hasilPerkalianC4,
      batrai: hasilPerkalianC5,
    );
    print(
        "======== Proses penjumlahan pada tiap kriteria dari database ======== ");
    print("Hasil penjulahan : $hasilPenjulahanAllData");
    print("================================================================\n");
    print(
        "======== Proses pembulata data pada tiap kriteria dari database ======== ");
    List<int> pembulatan = [];
    hasilPenjulahanAllData.forEach((element) {
      pembulatan.add(element.ceil());
    });
    print("Hasil pembualatan : $pembulatan");
    print("================================================================\n");

    /// -------------------------------------------------------------------
    /// memasukan hasilPenjulahanAllData ke mapping dataHp
    List<Map<String, dynamic>> dataHpFinalSaw =
        dataHpSaw(dataPenjumlahan: hasilPenjulahanAllData);

    print("======== Data hp sebelum di sort ======== ");
    dataHpFinalSaw.forEach((element) {
      print("nama hp : ${element['nama']} , hasil  ${element['result']}");
    });
    print("================================================================\n");

    dataHpFinalSawSort =
        sortDataHp(dataHp: dataHpFinalSaw, bobotHarga: BobotPreferensiHarga);
  }

  /// List data hp yang sudah dilakukan proses SAW
  List<Map<String, dynamic>> dataHpFinalSawSort = [];
}
