import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/pages/book_list_page.dart';

void main() {
  runApp(const KioskBookReaderApp());
}

class KioskBookReaderApp extends StatelessWidget {
  const KioskBookReaderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: const BookListPage(title: 'Flutter Demo Home Page'),
    );
  }
}