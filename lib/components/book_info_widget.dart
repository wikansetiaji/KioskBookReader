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
      flex: 57,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          spacing: 15,
          children: [
            Expanded(
              flex: 60,
              child: Column(
                spacing: 15,
                children: [
                  Expanded(
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
                                      shadowColor:
                                          Colors
                                              .transparent, // Removes button shadow
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
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: double.infinity,
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
                          SizedBox(
                            height: 130,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (var i = 0; i < 10; i++)
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      'assets/pahesan/cover.jpg',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 40,
              child: Column(
                spacing: 15,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        color: Color.fromARGB(255, 254, 250, 242),
                        child: Image.asset(
                          'assets/authors/maramis.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        color: Color.fromARGB(255, 255, 239, 212),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LATAR BELAKANG',
                              style: const TextStyle(
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 119, 24, 45),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                  'Maria Walanda Maramis, lahir di Sulawesi Utara pada 1 Desember 1872, adalah pelopor emansipasi perempuan yang menekankan peran ibu dalam keluarga dan pendidikan anak. Ia mendirikan PIKAT dan Sekolah Rumah Tangga (Huishold School) untuk pendidikan gratis untuk anak-anak perempuan, menulis di Tjehaja Sijang, dan memperjuangkan hak politik perempuan lewat kampanye surat ke Batavia.',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
