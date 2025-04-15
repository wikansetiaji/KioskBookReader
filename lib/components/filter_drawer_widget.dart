import 'package:flutter/material.dart';

class FilterDrawerWidget extends StatelessWidget {
  const FilterDrawerWidget({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width * 1 / 2,
      color: Color.fromARGB(255, 162, 29, 58),
      padding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.0,
          children: [
            Text(
              'KARYA TULISAN',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 239, 233, 209),
              ),
              textAlign: TextAlign.center,
            ),
    
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'R.A Kartini',
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    textAlign: TextAlign.center,
                  ),
    
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Text(
                          'Surat untuk J.H. Abendanon',
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 239, 233, 209),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Surat untuk J.H. Abendanon',
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 239, 233, 209),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Surat untuk J.H. Abendanon',
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 239, 233, 209),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
