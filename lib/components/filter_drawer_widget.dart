import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/author.dart';
import 'package:kiosk_book_reader/pages/img_book_read_page.dart';
import 'package:kiosk_book_reader/repository/books_repository.dart';
import 'package:kiosk_book_reader/service/size_config.dart';

class FilterDrawerWidget extends StatelessWidget {
  const FilterDrawerWidget({
    super.key,
    required this.context,
    this.onSelectAuthor,
  });

  final BuildContext context;
  final Function(Author?)? onSelectAuthor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width * 1 / 2,
      color: Color.fromARGB(255, 162, 29, 58),
      padding: EdgeInsets.all(16.sc),
      child: Padding(
        padding: EdgeInsets.all(16.0.sc),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.0,
          children: [
            Text(
              'KARYA TULISAN',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 40.sc,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 239, 233, 209),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.sc),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Container(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        onSelectAuthor?.call(null);
                      },
                      child: Text(
                        'Semua Tulisan',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: 36.sc,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  for (var author in BooksRepository().getAllAuthors())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              onSelectAuthor?.call(author);
                            },
                            child: Text(
                              author.name,
                              style: TextStyle(
                                fontFamily: 'Archivo',
                                fontSize: 36.sc,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(16.0.sc),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 16,
                            children: [
                              for (var book in BooksRepository()
                                  .getBooksFromAuthor(author: author))
                                Container(
                                  width: double.infinity,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  ImgBookReadPage(book: book),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      book.title,
                                      style: TextStyle(
                                        fontFamily: 'Archivo',
                                        fontSize: 32.sc,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(
                                          255,
                                          239,
                                          233,
                                          209,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            SizedBox(height: 20.sc,),
            Text(
              'MEDIA',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 40.sc,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 239, 233, 209),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.sc),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var book in BooksRepository().getBooksWithoutAuthor())
                    Container(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImgBookReadPage(book: book),
                            ),
                          );
                        },
                        child: Text(
                          book.title,
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            fontSize: 36.sc,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 255, 255),
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
