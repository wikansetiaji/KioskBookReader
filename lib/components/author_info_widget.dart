import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/author.dart';

class AuthorInfoWidget extends StatelessWidget {
  final Author author;

  const AuthorInfoWidget({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, left: 40.0, right: 40.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Expanded(
              flex: 40,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        color: Color.fromARGB(255, 254, 250, 242),
                        child: Image.asset(
                          'assets/authors/${author.id}.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: author.name[0].toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'Playball',
                                  fontWeight:
                                      FontWeight
                                          .normal, // Playball is script, bold might not look good
                                  color: Color.fromARGB(255, 119, 24, 45),
                                  fontSize: 24,
                                ),
                              ),
                              TextSpan(
                                text: author.name.substring(1).toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 119, 24, 45),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          author.birthDeathDate,
                          style: const TextStyle(
                            fontFamily: 'Archivo',
                            color: Color.fromARGB(255, 85, 85, 85),
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Color.fromARGB(255, 255, 239, 212),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LATAR BELAKANG',
                        style: const TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 24, 45),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            author.background,
                            style: const TextStyle(
                              fontFamily: 'PublicSans',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
