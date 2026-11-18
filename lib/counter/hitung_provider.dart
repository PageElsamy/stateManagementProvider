import 'package:flutter/material.dart';

class HitungProvider extends ChangeNotifier {
  // Siapkan variable yang nilainya akan dibagikan antar halaman
  // set modifier nya ke private dengan tanda _
  int _angka = 0;

  // buatkan method getter
  int get angka => _angka;

  // buat method untuk menambah angka + 1
  void tambah() {
    _angka++; // increment : setiap angkanya diambil akan ditambah 1
    notifyListeners();
  }

  void kurang() {
    _angka--;
    notifyListeners();
  }
}