import 'package:flutter/material.dart';

class KeranjangProvider extends ChangeNotifier {
  final List<String> _items = [];

  // method untuk mendapatkan item keranjang
  List<String> get items => _items;
  // method untuk mendapatkan jumlah item di keranjang
  int get jumlahItem => _items.length;

  void tambahItem(String namaProduk) {
    _items.add(namaProduk);
    notifyListeners();
  }

  void hapusItem(int noproduk) {
    _items.removeAt(noproduk);
    notifyListeners(); // memberi tahu listener bahwa ada perubahan
  }

  void kosongkanKeranjang() {
    _items.clear();
    notifyListeners(); // memberi tahu listener bahwa ada perubahan
  }
}