import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kiosk_book_reader/components/book_card.dart';
import 'package:kiosk_book_reader/models/book.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key, required this.title});
  final String title;

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final List<Book> books = [
    Book(
      title: 'Three Body Problem',
      author: 'Liu Cixin',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1415428227i/20518872.jpg',
      year: 2008,
    ),
    Book(
      title: 'Death\'s End',
      author: 'Liu Cixin',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1430330507i/25451264.jpg',
      year: 2010,
    ),
    Book(
      title: 'The Dark Forest',
      author: 'Liu Cixin',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1412064931i/23168817.jpg',
      year: 2008,
    ),
    Book(
      title: 'Blindsight',
      author: 'Peter Watts',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1386924412i/48484.jpg',
      year: 2006,
    ),
    Book(
      title: 'Eon',
      author: 'Greg Bear',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388288738i/840278.jpg',
      year: 1985,
    ),
    Book(
      title: 'Children of Time',
      author: 'Adrian Tchaikovsky',
      coverUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE8BkSeYSjdvoKnsqQGGcyLq2n48Xgh0W-EA&s',
      year: 2015,
    ),
    Book(
      title: 'Rendezvous with Rama',
      author: 'Arthur C. Clarke',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1405456427i/112537.jpg',
      year: 1973,
    ),
    Book(
      title: 'Tau Zero',
      author: 'Poul Anderson',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1389216838i/240617.jpg',
      year: 1970,
    ),
    Book(
      title: 'The Forever War',
      author: 'Joe Haldeman',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1432954110i/186773.jpg',
      year: 1974,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              items: [for (var book in books) BookCard(book: book)],
              options: CarouselOptions(
                aspectRatio: 4 / 1,
                viewportFraction: 0.16,
                initialPage: 0,
                autoPlay: true,
                enableInfiniteScroll: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 3000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.1,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
