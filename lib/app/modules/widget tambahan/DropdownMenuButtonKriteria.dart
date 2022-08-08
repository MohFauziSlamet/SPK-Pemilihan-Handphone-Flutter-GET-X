// ignore: file_names
// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

Container DropdownMenuButtonKriteria(
    {required List<Map<String, dynamic>> dataMapping,
    required String value,
    required String detail,
    required void Function(Map<String, dynamic>?)? onChanged,
    int? nilaiData}) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: DropdownSearch<Map<String, dynamic>>(
        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
        ),
        dropdownButtonProps: const DropdownButtonProps(
          color: Colors.white,
        ),
        items: dataMapping,

        onChanged: onChanged,

        /// mengatur tampilan pada list item nya
        /// karena bentuk nya mapping , secara default akan ditampilkan semau
        /// jadi kita set custom , key apa yang ingin ditampilkan
        popupProps: PopupProps.dialog(
          itemBuilder: (context, item, isSelected) {
            return ListTile(
              title: Text(item[value].toString()),
            );
          },
        ),

        /// mengatur tampilan pada selectedItem
        dropdownBuilder: (context, selectedItem) {
          return Text(selectedItem?[value] ?? ' Silahkan Masukan Data $detail');
        },

        /// untuk menambahkan tombol hapus , berupa simbol X
        clearButtonProps: const ClearButtonProps(
          color: Colors.black,
          autofocus: true,
          alignment: Alignment.centerRight,
          icon: Icon(Icons.delete_forever),
          // enableFeedback: true,
          isVisible: true,
        ),
      ),
    ),
  );
}
