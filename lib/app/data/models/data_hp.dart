// To parse this JSON data, do
//
//     final dataHp = dataHpFromJson(jsonString);

import 'dart:convert';

DataHp dataHpFromJson(String str) => DataHp.fromJson(json.decode(str));

String dataHpToJson(DataHp data) => json.encode(data.toJson());

class DataHp {
  DataHp({
    required this.nama,
    required this.harga,
    required this.ram,
    required this.rom,
    required this.camera,
    required this.batrai,
    required this.imageUrl_1,
    required this.imageUrl_2,
    required this.imageUrl_3,
    this.hasil,
  });

  String nama;
  String imageUrl_1;
  String imageUrl_2;
  String imageUrl_3;
  double harga;
  int ram;
  int rom;
  int camera;
  int batrai;
  double? hasil;

  factory DataHp.fromJson(Map<String, dynamic> json) => DataHp(
        nama: json["nama"],
        harga: json["harga"],
        ram: json["ram"],
        rom: json["rom"],
        camera: json["camera"],
        batrai: json["batrai"],
        imageUrl_1: json['imageUrl-1'],
        imageUrl_2: json['imageUrl-2'],
        imageUrl_3: json['imageUrl-3'],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "harga": harga,
        "ram": ram,
        "rom": rom,
        "camera": camera,
        "batrai": batrai,
        "imageUrl-1": imageUrl_1,
        "imageUrl-2": imageUrl_2,
        "imageUrl-3": imageUrl_3,
      };
}
