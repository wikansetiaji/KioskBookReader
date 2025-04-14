class Book {
  final String id;
  final String title;
  final String author;
  final String date;
  final int numberOfPage;
  final int highlightPage;
  final double highlightCenterX;
  final double highlightCenterY;
  final double highlightWidth;
  final double highlightHeight;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.date,
    required this.numberOfPage,
    required this.highlightPage,
    required this.highlightCenterX, 
    required this.highlightCenterY,
    required this.highlightWidth,
    required this.highlightHeight,
  });
}
