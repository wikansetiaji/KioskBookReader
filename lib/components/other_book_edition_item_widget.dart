import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/pages/img_book_read_page.dart';

class OtherBookEditionItemWidget extends StatelessWidget {
  final Book book;

  const OtherBookEditionItemWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ImgBookReadPage(book: book);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Expanded(
              flex: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/${book.id}/cover.jpg',
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Container()),
                            Text(
                              book.edition ?? book.title,
                              style: TextStyle(
                                fontFamily: 'Archivo',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  if (book.edition != null)
                    Text(
                      book.edition!,
                      style: const TextStyle(
                        fontFamily: 'Archivo',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  Text(
                    book.date,
                    style: const TextStyle(
                      fontFamily: 'Archivo',
                      color: Colors.black,
                      fontSize: 18,
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
