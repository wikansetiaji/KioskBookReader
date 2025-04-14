import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/components/book_list_widget.dart';
import 'package:kiosk_book_reader/models/book.dart';

class BookFilterPage extends StatefulWidget {
  const BookFilterPage({super.key, required this.book});

  final Book book;

  @override
  State<BookFilterPage> createState() => _BookFilterPageState();
}

class _BookFilterPageState extends State<BookFilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 233, 212),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image.asset('assets/bg-texture.png', fit: BoxFit.cover),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    'assets/header.png',
                    fit: BoxFit.fitHeight,
                    height: 80,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor:
                              Colors.transparent, // Removes button shadow
                          side: BorderSide(
                            color: Color.fromARGB(255, 162, 29, 58),
                            width: 2,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          '< KEMBALI',
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 162, 29, 58),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  Text(
                    'ARSIP DIGITAL',
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      fontSize: 18,
                      color: Color.fromARGB(255, 85, 85, 85),
                      letterSpacing: -0.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Text(
                        'TULISAN KARYA',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 85, 85, 85),
                          letterSpacing: -1.5,
                          height: 0.8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'SEMUA PENULIS WANITA',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 24, 45),
                          letterSpacing: -1.5,
                          height: 0.8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  SizedBox(height: 20),

                  BookListWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}