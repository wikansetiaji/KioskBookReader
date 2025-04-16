import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/author.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';
import 'package:kiosk_book_reader/service/size_config.dart';
import 'package:provider/provider.dart';

class AuthorInfoWidget extends StatelessWidget {
  final Author author;

  const AuthorInfoWidget({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.sc,
      child: Padding(
        padding: EdgeInsets.only(bottom: 40.0.sc, left: 80.0.sc, right: 80.0.sc),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 40.sc,
          children: [
            Expanded(
              flex: 40,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.sc)),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.sc),
                        color: Color.fromARGB(255, 254, 250, 242),
                        child: Image.asset(
                          'assets/authors/${author.id}.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.sc),
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
                                  fontSize: 24.sc,
                                ),
                              ),
                              TextSpan(
                                text: author.name.substring(1).toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 119, 24, 45),
                                  fontSize: 16.sc,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.sc),
                        Text(
                          author.birthDeathDate,
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            color: Color.fromARGB(255, 85, 85, 85),
                            fontSize: 14.sc,
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
                borderRadius: BorderRadius.all(Radius.circular(10.sc)),
                child: Container(
                  padding: EdgeInsets.all(16.sc),
                  color: Color.fromARGB(255, 255, 239, 212),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.watch<LanguageProvider>().isEnglish ? 'BACKGROUND' : 'LATAR BELAKANG',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 24, 45),
                          fontSize: 16.sc,
                        ),
                      ),
                      SizedBox(height: 10.sc),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            author.getBackgrond(context),
                            style: TextStyle(
                              fontFamily: 'PublicSans',
                              color: Colors.black,
                              fontSize: 19.sc,
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
