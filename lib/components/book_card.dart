import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: book.coverUrl,
                  placeholder: (context, url) {
                    return Center(child: CircularProgressIndicator());
                  },
                  errorWidget: (context, url, error) {
                    return Center(child: Icon(Icons.error));
                  },
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
              book.year.toString(),
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 5),
            Text('by ${book.author}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
