import 'package:kiosk_book_reader/models/book.dart';

class Author {
  final String id;
  final String name;
  final String birthDeathDate;
  final String background;
  final String image;

  Author({
    required this.id,
    required this.name,
    required this.birthDeathDate,
    required this.background,
    required this.image,
  });
}