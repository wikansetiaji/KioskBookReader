class Book {
  final String id;
  final String type;
  final String title;
  final String date;
  final String contentTitle;
  final String content;
  final int numberOfPage;
  final String? authorId;
  final BookHighlight? highlight;
  final String? collection;
  final String? edition;
  final String? editionId;
  final bool isOtherEdition;

  Book({
    required this.id,
    required this.type,
    required this.title,
    required this.date,
    required this.contentTitle,
    required this.content,
    required this.numberOfPage,
    this.authorId,
    this.collection,
    this.edition,
    this.highlight,
    this.editionId,
    this.isOtherEdition = false,
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
