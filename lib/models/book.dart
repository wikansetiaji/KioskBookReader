class Book {
  final String id;
  final String type;
  final String title;
  final String date;
  final String contentTitle;
  final String content;
  final int numberOfPage;
  final BookHighlight? highlight;
  final String? collection;
  final String? edition;
  final List<Book> otherEdition;

  Book({
    required this.id,
    required this.type,
    required this.title,
    required this.date,
    required this.contentTitle,
    required this.content,
    required this.numberOfPage,
    this.collection,
    this.edition,
    this.highlight,
    this.otherEdition = const [],
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
