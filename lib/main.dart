import 'dart:math';
import 'package:flutter/material.dart';
import 'data/kelimeler.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
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

  String kelime = "";
  String kategori = "";
  String zorluk = "";
  List<String> tanimlar = [];

  bool tumTanimlar = false;


  @override
  void initState() {
    super.initState();
    yeniKelime();
  }


  void yeniKelime() {

    final secilen =
        kelimeler[Random().nextInt(kelimeler.length)];

    setState(() {

      kelime = secilen["kelime"];
      kategori = secilen["kategori"];
      zorluk = secilen["zorluk"];

      tanimlar =
          List<String>.from(secilen["tanimlar"]);

      tumTanimlar = false;

    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
  backgroundColor: Colors.black,
  appBar: AppBar(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  elevation: 0,
  title: const Text("Kelime Avı"),
  centerTitle: true,
),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [
            const SizedBox(height:30),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Card(
  key: ValueKey(kelime),
  elevation: 8,
  color: Colors.white,
  shadowColor: Colors.black26,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  ),

                child: Column(

  crossAxisAlignment: CrossAxisAlignment.center,

  children: [

    Container(
  height: 6,
  width: double.infinity,
  decoration: const BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  ),
),

    const SizedBox(height: 20),

                    Text(
                      "📌 $kelime",
                      style: const TextStyle(
                        fontSize:32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height:10),

                    Align(
  alignment: Alignment.centerLeft,
  child: Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 8,
  ),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Text(
    "🏷️ Kategori: $kategori",
    style: const TextStyle(
      fontSize:16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
),
  ),
),
                    const SizedBox(height:25),

                    Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 8,
  ),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  ),
  child: const Text(
    "📝 Tanım",
    style: TextStyle(
      fontSize:22,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
),

                    const SizedBox(height:15),

                    if (!tumTanimlar)
                      Text(
                        tanimlar[0],
                        style: const TextStyle(
                          fontSize:17,
                        ),
                        textAlign: TextAlign.center,
                      ),

                    if (tumTanimlar)
                      ...List.generate(
                        tanimlar.length,
                        (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom:12),

                            child: Text(
                              "${index + 1}. ${tanimlar[index]}",
                              style: const TextStyle(
                                fontSize:17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),

                    const SizedBox(height:20),
                       ElevatedButton.icon(
  onPressed: () {

    setState(() {
      tumTanimlar = true;
    });

  },

  icon: const Icon(
    Icons.lightbulb_outline,
  ),

  label: const Text(
    "İpucu Göster",
    style: TextStyle(
      fontSize:17,
    ),
  ),

  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.indigo.shade50,
    foregroundColor: Colors.indigo,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
),
                    

                                    ],
                ),
              ),
            ),
            const SizedBox(height: 25),

ElevatedButton.icon(

              onPressed: yeniKelime,

              icon: const Icon(
                Icons.refresh,
              ),

              label: const Text(
                "Yeni Kelime",
                style: TextStyle(
                  fontSize:18,
                ),
              ),

              style: ElevatedButton.styleFrom(
  backgroundColor: Colors.indigo,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(
    horizontal:40,
    vertical:15,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
),

            ),

            const SizedBox(height:20),

          ],
        ),
      ),
    );
  }
}
