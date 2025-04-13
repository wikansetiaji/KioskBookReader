import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kiosk_book_reader/components/book_card.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/pages/pdf_book_read_page.dart';
import 'package:kiosk_book_reader/pages/img_book_read_page.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key, required this.title});
  final String title;

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final List<Book> books = [
    Book(id: "tjahaja_siang", title: "Tjahaja Siang", author: "Wikan Setiadji", date: " 15 Juni 1917", numberOfPage: 4),
    Book(id: "pahesan", title: "Pahesan", author: "Wikan Setiadji", date: " 15 Juni 1917", numberOfPage: 12)
  ];

  CarouselSliderController booksCarouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              items: [
                for (var book in books)
                  BookCard(
                    book: book,
                    onTap: () async {
                      booksCarouselController.animateToPage(books.indexOf(book),
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      await Future.delayed(Duration(milliseconds: 400)); // Add a delay
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ImgBookReadPage(book: book,)),
                      );
                    },
                  ),
              ],
              carouselController: booksCarouselController,
              options: CarouselOptions(
                aspectRatio: 1.8,
                viewportFraction: 0.3,
                initialPage: 0,
                autoPlay: true,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 3000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
