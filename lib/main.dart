import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/pages/home_page.dart';

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
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}