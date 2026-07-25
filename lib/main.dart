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

  final List<Map<String, dynamic>> kelimeler = [

    {
      "kelime": "SENATO",
      "zorluk": "Zor",
      "tanimlar": [
        "Bazı ülkelerde yasama organının üst kanadı olarak görev yapan meclis.",
        "İki meclisli parlamentolarda üst meclis olarak görev yapan yasama organı."
      ]
    },

    {
      "kelime": "DEMOKRASİ",
      "zorluk": "Orta",
      "tanimlar": [
        "Halkın yönetime katıldığı yönetim biçimi.",
        "Vatandaşların siyasi haklara sahip olduğu sistem."
      ]
    },

    {
      "kelime": "GALAKSİ",
      "zorluk": "Zor",
      "tanimlar": [
        "Milyarlarca yıldız, gaz ve tozdan oluşan büyük uzay sistemi.",
        "Uzayda bulunan büyük yıldız topluluklarından biri."
      ]
    },

  ];


  String kelime = "";
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
      zorluk = secilen["zorluk"];

      tanimlar =
      List<String>.from(secilen["tanimlar"]);

      tumTanimlar = false;

    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Kelime Avı"),
        centerTitle: true,
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height:30),


            Card(
              elevation:5,

              child: Padding(
                padding: const EdgeInsets.all(25),

                child: Column(

                  children: [

                    Text(
                      "📌 $kelime",
                      style: const TextStyle(
                        fontSize:30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                    const SizedBox(height:10),


                    Text(
                      "🎯 Zorluk: $zorluk",
                      style: const TextStyle(
                        fontSize:16,
                      ),
                    ),


                    const SizedBox(height:25),


                    const Text(
                      "📝 Tanım",
                      style: TextStyle(
                        fontSize:22,
                        fontWeight: FontWeight.bold,
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


                    if (!tumTanimlar && tanimlar.length > 1)

                      TextButton(

                        onPressed: () {

                          setState(() {

                            tumTanimlar = true;

                          });

                        },

                        child: const Text(
                          "➕ Bir Tanım Daha",
                          style: TextStyle(
                            fontSize:17,
                          ),
                        ),

                      ),


                  ],

                ),

              ),

            ),


            const Spacer(),


            const Divider(),


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
                padding: const EdgeInsets.symmetric(
                  horizontal:40,
                  vertical:15,
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