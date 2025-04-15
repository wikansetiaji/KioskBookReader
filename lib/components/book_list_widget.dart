import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/components/book_list_item_widget.dart';
import 'package:kiosk_book_reader/models/book.dart';

class BookListWidget extends StatefulWidget {
  const BookListWidget({super.key});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  final List<Book> books = [
    Book(
      id: "tjahaja_siang",
      title: "Tjahaja Siang",
      author: "Maria Walanda Maramis",
      date: "15 Juni 1917",
      numberOfPage: 4,
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.73,
        width: 0.3,
        height: 0.38,
      ),
    ),
    Book(
      id: "pahesan",
      title: "Pahesan",
      author: "Wikan Setiadji",
      date: "15 Juni 1917",
      numberOfPage: 12,
      highlight: BookHighlight(
        page: 3,
        centerX: 0.72,
        centerY: 0.76,
        width: 0.39,
        height: 0.20,
      ),
    ),
    Book(
      id: "tjahaja_siang",
      title: "Tjahaja Siang",
      author: "Maria Walanda Maramis",
      date: "15 Juni 1917",
      numberOfPage: 4,
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.73,
        width: 0.3,
        height: 0.38,
      ),
    ),
    Book(
      id: "pahesan",
      title: "Pahesan",
      author: "Wikan Setiadji",
      date: "15 Juni 1917",
      numberOfPage: 12,
      highlight: BookHighlight(
        page: 3,
        centerX: 0.72,
        centerY: 0.76,
        width: 0.39,
        height: 0.20,
      ),
    ),
    Book(
      id: "tjahaja_siang",
      title: "Tjahaja Siang",
      author: "Maria Walanda Maramis",
      date: "15 Juni 1917",
      numberOfPage: 4,
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.73,
        width: 0.3,
        height: 0.38,
      ),
    ),
    Book(
      id: "pahesan",
      title: "Pahesan",
      author: "Wikan Setiadji",
      date: "15 Juni 1917",
      numberOfPage: 12,
      highlight: BookHighlight(
        page: 3,
        centerX: 0.72,
        centerY: 0.76,
        width: 0.39,
        height: 0.20,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = constraints.biggest;
        double spacing = 40;
        double imageSize = (screenSize.width - spacing * 3) / 2;
    
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: spacing, vertical: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    for (int i = 0; i < books.length; i += 2)
                      BookListItemWidget(
                        book: books[i],
                        width: imageSize,
                        spacing: spacing,
                      ),
                  ],
                ),
              ),
              SizedBox(width: spacing),
              Column(
                children: [
                  for (int i = 1; i < books.length; i += 2)
                    BookListItemWidget(
                      book: books[i],
                      width: imageSize,
                      spacing: spacing,
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
