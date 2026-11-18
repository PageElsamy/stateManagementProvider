import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const new({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _namapengguna = TextEditingController(); // deklarasi
  final _kunci = GlobalKey<FormState>();

  @override // jangan lupa di hancurkan setelahnya
    void dispose() {
      _namapengguna.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latihan input form")),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Form(
            key: _kunci,
            child: Column(
              children: [
                TextFormField(
                  controller: _namapengguna,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama pengguna",
                    hintText: "Masukkan nama pengguna", // kayak placeholder
                    // prefixText: "Pak / Bu ",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  // obscureText: true,
                  keyboardType: TextInputType.number, // input nya harus pake emulator, karena ini keyboard huruf
                  onChanged: (value) { // minta render ulang ketika sedang mengetik
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) { // trim : menghilangkan spasi diakhir
                      return "Nama pengguna wajib diisi!";
                    }
                    else if (value.length <= 6) {
                      return "Nama pengguna minimal 6 karakter";
                    }
                    return null; // validator membutuhkan kebalikan (? apa anjayy cepet ngomongnya) berupa string yang juga bisa null
                  },
                ),
                SizedBox(height: 20),
                Text(_namapengguna.text),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (!_kunci.currentState!.validate()) return;
                    print(_namapengguna.text);
                  }, 
                  child: Text("Simpan")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}