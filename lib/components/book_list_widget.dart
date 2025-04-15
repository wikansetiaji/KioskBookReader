import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/components/book_list_item_widget.dart';
import 'package:kiosk_book_reader/models/book.dart';

class BookListWidget extends StatefulWidget {
  final List<Book> books;

  const BookListWidget({super.key, required this.books});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = constraints.biggest;
        double spacing = 40;
        double imageSize = (screenSize.width - spacing * 3) / 2;
    
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    for (int i = 0; i < widget.books.length; i += 2)
                      BookListItemWidget(
                        book: widget.books[i],
                        width: imageSize,
                        spacing: spacing,
                      ),
                  ],
                ),
              ),
              SizedBox(width: spacing),
              Column(
                children: [
                  for (int i = 1; i < widget.books.length; i += 2)
                    BookListItemWidget(
                      book: widget.books[i],
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
