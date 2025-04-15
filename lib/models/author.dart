import 'package:kiosk_book_reader/models/book.dart';

class Author {
  final String name;
  final String birthDeathDate;
  final String background;
  final String image;
  final List<Book> books;

  Author({
    required this.name,
    required this.birthDeathDate,
    required this.background,
    required this.image,
    required this.books
  });
}