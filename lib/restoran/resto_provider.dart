import 'package:flutter/material.dart';

class RestoProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _pesanan = [];

  List<Map<String, dynamic>> get pesanan => _pesanan;

  int get totalItemPesanan => 
    _pesanan.fold(0, (total, item) => total + (item['jumlah'] as int));

  int get totalBayar => 
    _pesanan.fold(0, (total, item) => total + (item['subtotal'] as int));
  
  void tambahPesanan(Map<String, dynamic> item) {
    final index = _pesanan.indexWhere((e) => e['id'] == item['id']);
    final harga = int.tryParse(item['harga'].toString()) ?? 0;

    if (index != -1) {
      _pesanan[index]['jumlah'] += 1;
      _pesanan[index]['subtotal'] =
        _pesanan[index]['jumlah'] * _pesanan[index]['harga'];
    } else {
      _pesanan.add({
        'id': item['id'],
        'jumlah': 1,
        'harga': harga,
        'subtotal': harga,
      });
    }
    notifyListeners();
  }

  void hapusItemPesanan(String id) {
    _pesanan.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  void kosongkanPesanan() {
    _pesanan.clear();
    notifyListeners();
  }
}