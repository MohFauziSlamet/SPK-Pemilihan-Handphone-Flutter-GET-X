class BobotPreferensi {
  int? harga;
  int? ram;
  int? rom;
  int? camera;
  int? batrai;

  BobotPreferensi({this.harga, this.ram, this.rom, this.camera, this.batrai});

  BobotPreferensi.fromJson(Map<String, dynamic> json) {
    harga = json['harga'];
    ram = json['ram'];
    rom = json['rom'];
    camera = json['camera'];
    batrai = json['batrai'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['harga'] = harga;
    data['ram'] = ram;
    data['rom'] = rom;
    data['camera'] = camera;
    data['batrai'] = batrai;
    return data;
  }
}
