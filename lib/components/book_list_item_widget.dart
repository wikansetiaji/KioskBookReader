import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/pages/img_book_read_page.dart';
import 'package:kiosk_book_reader/service/size_config.dart';

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
              borderRadius: BorderRadius.circular(10.sc),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/${book.id}/cover.webp',
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
                      padding: EdgeInsets.all(20.sc),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Container()),
                          Text(
                            book.getType(context).toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: 25.sc,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            book.title.toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: 25.sc,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 10.sc),
                          if (book.edition != null)
                            Column(
                              children: [
                                Text(
                                  book.getEdition(context)!,
                                  style: TextStyle(
                                    fontFamily: 'Archivo',
                                    fontSize: 18.sc,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 16.sc),
                              ],
                            ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.sc),
                            child: Container(
                              padding: EdgeInsets.all(5.sc),
                              color: Color.fromARGB(255, 162, 29, 58),
                              child: Text(
                                book.getDate(context).toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  fontSize: 16.sc,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.sc),
                          if (book.collection != null)
                            Text(
                              book.getCollection(context)!,
                              style: TextStyle(
                                fontFamily: 'Archivo',
                                fontSize: 16.sc,
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
