import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/book.dart';

class BookInfoWidget extends StatelessWidget {
  final Book book;
  final VoidCallback onShowHighlight;

  const BookInfoWidget({
    super.key,
    required this.book,
    required this.onShowHighlight,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 30,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left side - Book content
            Expanded(
              flex: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Color.fromARGB(255, 255, 239, 212),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '“DJEMPOETAN BAGI BANGSA PEREMPUAN”',
                        style: const TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          if (book.highlight != null)
                            ElevatedButton(
                              onPressed: () {
                                onShowHighlight();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                side: BorderSide(
                                  color: Color.fromARGB(255, 162, 29, 58),
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                'LIHAT TAJUK TULISAN ASLI >',
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  color: Color.fromARGB(255, 162, 29, 58),
                                ),
                              ),
                            ),
                          Expanded(child: Container()),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
                            style: const TextStyle(
                              fontFamily: 'PublicSans',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(width: 15),

            // Right side - Other editions
            Expanded(
              flex: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BACA EDISI LAINNYA,',
                        style: const TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 24, 45),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Column(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  for (var i = 0; i < 10; i++)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 15,
                                        children: [
                                          Expanded(
                                            flex: 50,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                    'assets/pahesan/cover.jpg',
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                  Positioned.fill(
                                                    child: Image.asset(
                                                      'assets/gradient-rect.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Positioned.fill(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            8.0,
                                                          ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Container(),
                                                          ),
                                                          Text(
                                                            'Edisi No. 12 Tahun 48',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Archivo',
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Tjahaja Sjiang',
                                                  style: const TextStyle(
                                                    fontFamily: 'Archivo',
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'Edisi No 12',
                                                  style: const TextStyle(
                                                    fontFamily: 'Archivo',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'Tahun 1948',
                                                  style: const TextStyle(
                                                    fontFamily: 'Archivo',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                  255,
                                  239,
                                  233,
                                  209,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                              ),
                              child: Text(
                                'LIHAT GALERI ARSIP',
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 85, 85, 85),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
