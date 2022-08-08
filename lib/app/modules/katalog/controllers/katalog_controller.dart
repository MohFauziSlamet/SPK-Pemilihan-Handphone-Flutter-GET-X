import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class KatalogController extends GetxController {
  /// inisiasi awal cloud_firestore.
  /// sebelum menggunakan ini , ada dua yang harus di inisiasi, yaitu
  /// inisiasi firebase lalu firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// data akan dipantau secara real time
  /// sehingga ketika ada perubahan , pada database . akan langsung kedeteksi oleh aplikasi
  Stream<QuerySnapshot<Object?>> streamGetData() {
    CollectionReference productHp = firestore.collection("data-hp");

    return productHp.snapshots();
  }
}
