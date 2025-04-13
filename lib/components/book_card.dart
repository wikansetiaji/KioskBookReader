import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback? onTap;

  const BookCard({super.key, required this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: double.infinity, // Takes full width
                    child: Image.asset(
                      'assets/${book.id}/cover.jpg',
                      fit: BoxFit.cover, // Changed from fill to cover
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                book.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Text(
                book.date.toString(),
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 5),
              Text('oleh ${book.author}', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
