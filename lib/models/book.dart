class Book {
  final String id;
  final String title;
  final String author;
  final String date;
  final int numberOfPage;
  final BookHighlight? highlight;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.date,
    required this.numberOfPage,
    this.highlight,
  });
}

class BookHighlight {
  final int page;
  final double centerX;
  final double centerY;
  final double width;
  final double height;

  BookHighlight({
    required this.page,
    required this.centerX,
    required this.centerY,
    required this.width,
    required this.height,
  });
}