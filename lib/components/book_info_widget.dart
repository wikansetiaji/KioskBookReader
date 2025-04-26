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
    var seeOtherButton = SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookFilterPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 239, 233, 209),
          padding: EdgeInsets.symmetric(horizontal: 20.sc, vertical: 20.sc),
        ),
        child: Text(
          context.watch<LanguageProvider>().isEnglish
              ? 'VIEW ARCHIVE GALLERY'
              : 'LIHAT GALERI ARSIP',
          style: TextStyle(
            fontFamily: 'Archivo',
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 85, 85, 85),
            fontSize: 20.sc,
          ),
        ),
      ),
    );
    var seeOtherText = Text(
      context.watch<LanguageProvider>().isEnglish
          ? 'READ OTHER EDITIONS'
          : 'BACA EDISI LAINNYA',
      style: TextStyle(
        fontFamily: 'Archivo',
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 119, 24, 45),
        fontSize: 23.sc,
      ),
    );
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
                        book.getContentTitle(context).toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sc,
                        ),
                      ),
                      SizedBox(height: 16.sc),
                      if (book.highlights.isNotEmpty)
                        Column(
                          children: [
                            Row(
                              children: [
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
                                  child: Row(
                                    children: [
                                      Text(
                                        context.watch<LanguageProvider>().isEnglish
                                            ? 'VIEW ORIGINAL TEXT'
                                            : 'LIHAT TULISAN ASLI',
                                        style: TextStyle(
                                          fontFamily: 'Archivo',
                                          color: Color.fromARGB(255, 162, 29, 58),
                                          fontSize: 20.sc,
                                        ),
                                      ),
                                      Icon(Icons.chevron_right, color: Color.fromARGB(255, 162, 29, 58), size: 20.sc,)
                                    ],
                                  ),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                            SizedBox(height: 20.sc),
                          ],
                        ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            book.getContent(context),
                            style: TextStyle(
                              fontFamily: 'PublicSans',
                              color: Colors.black,
                              fontSize: 20.sc,
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
                  padding: EdgeInsets.all(20.sc),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (book.editionId != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            seeOtherButton,
                            SizedBox(height: 20.sc),
                            seeOtherText,
                          ],
                        ),
                      if (book.editionId == null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            seeOtherText,
                            SizedBox(height: 20.sc),
                            seeOtherButton,
                          ],
                        ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            for (var otherEdition in BooksRepository()
                                .getBookEditions(book: book))
                              Column(
                                children: [
                                  OtherBookEditionItemWidget(
                                    book: otherEdition,
                                  ),
                                  SizedBox(height: 10.sc),
                                ],
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
