import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kiosk_book_reader/components/book_card.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/pages/img_book_read_page.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key, required this.title});
  final String title;

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final List<Book> books = [
    Book(
      id: "tjahaja_siang",
      title: "Tjahaja Siang",
      author: "Wikan Setiadji",
      date: "15 Juni 1917",
      numberOfPage: 4,
    ),
    Book(
      id: "pahesan",
      title: "Pahesan",
      author: "Wikan Setiadji",
      date: "15 Juni 1917",
      numberOfPage: 12,
    ),
    Book(
      id: "tjahaja_siang",
      title: "Tjahaja Siang",
      author: "Wikan Setiadji",
      date: "15 Juni 1917",
      numberOfPage: 4,
    ),
    Book(
      id: "pahesan",
      title: "Pahesan",
      author: "Wikan Setiadji",
      date: "15 Juni 1917",
      numberOfPage: 12,
    ),
  ];

  final CarouselSliderController booksCarouselController =
      CarouselSliderController();
  double _carouselOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: books.length,
              carouselController: booksCarouselController,
              options: CarouselOptions(
                aspectRatio: 1.8,
                viewportFraction: 0.35,
                initialPage: 0,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                onScrolled: (value) {
                  setState(() {
                    _carouselOffset = value ?? 0;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final book = books[index];
                double distanceFromCenter =
                    ((_carouselOffset % books.length) - index);
                double rotationY =
                    (distanceFromCenter * -1).clamp(-1.0, 1.0) * 0.5; // radians

                return Transform(
                  transform:
                      Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // perspective
                        ..rotateY(rotationY)
                        ..translate(distanceFromCenter * 30),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () async {
                      booksCarouselController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      await Future.delayed(Duration(milliseconds: 400));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImgBookReadPage(book: book),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: double.infinity, // Takes full width
                          child: Image.asset(
                            'assets/${book.id}/cover.jpg',
                            fit: BoxFit.fill, // Changed from fill to cover
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
