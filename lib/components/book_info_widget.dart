import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/components/other_book_edition_item_widget.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/pages/book_filter_page.dart';
import 'package:kiosk_book_reader/repository/books_repository.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';
import 'package:kiosk_book_reader/service/size_config.dart';
import 'package:provider/provider.dart';

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
        padding: EdgeInsets.all(20.sc),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left side - Book content
            Expanded(
              flex: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.sc)),
                child: Container(
                  padding: EdgeInsets.all(16.sc),
                  color: Color.fromARGB(255, 255, 239, 212),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.contentTitle.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sc,
                        ),
                      ),
                      SizedBox(height: 16.sc),
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
                                context.watch<LanguageProvider>().isEnglish ? 'VIEW ORIGINAL WRITING >' : 'LIHAT TAJUK TULISAN ASLI >',
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  color: Color.fromARGB(255, 162, 29, 58),
                                  fontSize: 16.sc
                                ),
                              ),
                            ),
                          Expanded(child: Container()),
                        ],
                      ),
                      SizedBox(height: 20.sc),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            book.content,
                            style: TextStyle(
                              fontFamily: 'PublicSans',
                              color: Colors.black,
                              fontSize: 16.sc
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(width: 15.sc),

            // Right side - Other editions
            Expanded(
              flex: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.sc)),
                child: Container(
                  padding: EdgeInsets.all(16.sc),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.editionId != null
                            ? context.watch<LanguageProvider>().isEnglish ? 'SEE OTHER EDITIONS,' : 'BACA EDISI LAINNYA,'
                            : context.watch<LanguageProvider>().isEnglish ? 'SEE OTHER BOOKS' : 'BACA BUKU LAINNYA,',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 24, 45),
                          fontSize: 23.sc,
                        ),
                      ),
                      SizedBox(height: 10.sc),
                      Expanded(
                        child: Column(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  for (var otherEdition
                                      in book.editionId != null
                                          ? BooksRepository().getBookEditions(
                                            book: book,
                                          )
                                          : BooksRepository().getAllBooks())
                                    OtherBookEditionItemWidget(
                                      book: otherEdition,
                                    ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.popUntil(
                                  context,
                                  (Route<dynamic> route) => route.isFirst,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookFilterPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                  255,
                                  239,
                                  233,
                                  209,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.sc,
                                  vertical: 20.sc,
                                ),
                              ),
                              child: Text(
                                context.watch<LanguageProvider>().isEnglish ? 'VIEW ARCHIVE GALLERY' : 'LIHAT GALERI ARSIP',
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 85, 85, 85),
                                  fontSize: 20.sc,
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
