import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/pages/img_book_read_page.dart';

class BookListItemWidget extends StatelessWidget {
  const BookListItemWidget({
    super.key,
    required this.book,
    required this.width,
    required this.spacing,
  });

  final Book book;
  final double width;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImgBookReadPage(book: book),
              ),
            );
          },
          child: SizedBox(
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/${book.id}/cover.jpg',
                    fit: BoxFit.cover,
                    width: width,
                  ),
                  Positioned.fill(
                    child: Image.asset(
                      'assets/gradient-rect.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Container()),
                          Text(
                            'SURAT KABAR',
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'TJAHAJA SJIANG',
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Edisi No. 12 Tahun 48',
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              color: Color.fromARGB(255, 162, 29, 58),
                              child: Text(
                                '15 JUNI 1917',
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Koleksi PERPUSNAS',
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: spacing),
      ],
    );
  }
}
