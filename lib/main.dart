import 'package:flutter/material.dart';
import 'package:new_project/counter/hitung_provider.dart';
// import 'package:new_project/counter/page_3.dart';
// import 'package:new_project/counter/page_2.dart';
// import 'package:new_project/provider/katalog_page.dart';
// import 'package:new_project/provider/keranjang_page.dart';
import 'package:new_project/provider/keranjang_provider.dart';
import 'package:new_project/restoran/menu_resto_page.dart';
import 'package:new_project/restoran/nota_pesanan_page.dart';
import 'package:new_project/restoran/resto_provider.dart';
import 'package:provider/provider.dart';
// import 'package:new_project/form/page_1.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HitungProvider()),
        ChangeNotifierProvider(create: (context) => KeranjangProvider()),
        ChangeNotifierProvider(create: (context) => RestoProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => Page2()
        // '/': (context) => KatalogPage(),
        // '/3': (context) => Page3(),
        // '/keranjang': (context) => KeranjangPage(),
        '/menu-resto': (context) => MenuRestoPage(),
        '/pesanan-resto':(context) => NotaPesananPage(),
      }, 
      initialRoute: '/menu-resto',
    );
  }
}

// kalau -> tidak ada operasi sebelumnya langsung me-return
// kalau {} ada operasi dulu setelahnya me-return

// ChangeNotifierProvider : jika providernya HANYA satu
// MultiProvider : jika providernya LEBIH dari satu