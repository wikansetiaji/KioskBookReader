import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/author.dart';
import 'package:kiosk_book_reader/service/size_config.dart';

class AuthorInfoContentWidget extends StatelessWidget {
  final Author author;

  const AuthorInfoContentWidget({
    super.key,
    required this.author
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.sc,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 40.0.sc,
          left: 80.0.sc,
          right: 80.0.sc,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sc),
          ),
          child: Container(
            padding: EdgeInsets.all(20.sc),
            color: Color.fromARGB(255, 255, 239, 212),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      author.getContentType(context).toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                          255,
                          85,
                          85,
                          85,
                        ),
                        fontSize: 42.sc,
                      ),
                    ),
                    SizedBox(width: 20.sc),
                    Text(
                      author.contentTitle!.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                          255,
                          119,
                          24,
                          45,
                        ),
                        fontSize: 42.sc,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                Divider(
                  color: Color.fromARGB(
                    255,
                    167,
                    167,
                    167,
                  ),
                ),
                SizedBox(height: 10.sc),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      author.getContentDescription(context),
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
    );
  }
}
