import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const KelimeAvi());
}

class KelimeAvi extends StatelessWidget {
  const KelimeAvi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kelime Avı",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  final List<String> kelimeler = [
    "Elma",
    "Telefon",
    "Araba",
    "Kitap",
    "Bilgisayar",
    "Deniz",
    "Kedi",
    "Futbol",
    "Saat",
    "Kahve"
  ];

  String kelime = "Hazır";
  int puan = 0;

  void yeniKelime() {
    setState(() {
      kelime = kelimeler[Random().nextInt(kelimeler.length)];
    });
  }

  void bildim() {
    setState(() {
      puan++;
      yeniKelime();
    });
  }

  void pas() {
    setState(() {
      yeniKelime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kelime Avı"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Puan: $puan",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            Text(
              kelime,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: yeniKelime,
              child: const Text("Yeni Kelime"),
            ),

            ElevatedButton(
              onPressed: bildim,
              child: const Text("Bildim +1"),
            ),

            ElevatedButton(
              onPressed: pas,
              child: const Text("Pas Geç"),
            ),
          ],
        ),
      ),
    );
  }
}