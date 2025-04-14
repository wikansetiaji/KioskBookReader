import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/pages/img_book_read_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Book> books = [
    Book(
      id: "tjahaja_siang",
      title: "Tjahaja Siang",
      author: "Maria Walanda Maramis",
      date: "15 Juni 1917",
      numberOfPage: 4,
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.73,
        width: 0.3,
        height: 0.38,
      ),
    ),
    Book(
      id: "pahesan",
      title: "Pahesan",
      author: "Wikan Setiadji",
      date: "15 Juni 1917",
      numberOfPage: 12,
      highlight: BookHighlight(
        page: 3,
        centerX: 0.72,
        centerY: 0.76,
        width: 0.39,
        height: 0.20,
      ),
    ),
  ];

  final CarouselSliderController booksCarouselController =
      CarouselSliderController();
  double _carouselOffset = 0.0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 233, 212),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset('assets/bg-texture.png', fit: BoxFit.cover),
            ),
            Column(
              children: [
                SvgPicture.asset(
                  'assets/bg-texture-2.svg',
                  semanticsLabel: 'Dart Logo',
                ),
                Expanded(child: Container()),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  'assets/header.png',
                  fit: BoxFit.fitHeight,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'ARSIP DIGITAL',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 85, 85, 85),
                          letterSpacing: -0.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'JEJAK TULISAN',
                        style: TextStyle(
                          fontFamily: 'ArchivoBlack',
                          fontSize: 35,
                          color: Color.fromARGB(255, 119, 24, 45),
                          letterSpacing: -3.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'PEREMPUAN',
                        style: TextStyle(
                          fontFamily: 'ArchivoBlack',
                          fontSize: 70,
                          color: Color.fromARGB(255, 119, 24, 45),
                          letterSpacing: -3.2,
                          height: 0.8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'DI MASA PERGERAKAN NASIONAL',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          letterSpacing: -0.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider.builder(
                            itemCount: books.length,
                            carouselController: booksCarouselController,
                            options: CarouselOptions(
                              aspectRatio: 1.8,
                              viewportFraction: 0.35,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(
                                milliseconds: 2000,
                              ),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                _selectedIndex = index;
                              },
                              onScrolled: (value) {
                                setState(() {
                                  _carouselOffset = value ?? 0;
                                });
                              },
                            ),
                            itemBuilder: (context, index, realIndex) {
                              final book = books[index];
                              double distanceFromCenter =
                                  ((_carouselOffset % books.length) - index);
                              double rotationY =
                                  (distanceFromCenter * -1).clamp(-1.0, 1.0) *
                                  0.5; // radians

                              return Transform(
                                transform:
                                    Matrix4.identity()
                                      ..setEntry(3, 2, 0.001) // perspective
                                      ..rotateY(rotationY)
                                      ..translate(distanceFromCenter * 30),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {
                                    booksCarouselController.animateToPage(
                                      index,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Card(
                                    elevation: 3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        width:
                                            double.infinity, // Takes full width
                                        child: Image.asset(
                                          'assets/${book.id}/cover.jpg',
                                          fit:
                                              BoxFit
                                                  .fill, // Changed from fill to cover
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Row(
                            children: [
                              SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: () {
                                  if (_selectedIndex == 0) {
                                    booksCarouselController.animateToPage(
                                      books.length - 1,
                                    );
                                  } else {
                                    booksCarouselController.previousPage();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(16),
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    162,
                                    29,
                                    58,
                                  ),
                                ),
                                child: Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              ElevatedButton(
                                onPressed: () {
                                  if (_selectedIndex == books.length - 1) {
                                    booksCarouselController.animateToPage(0);
                                  } else {
                                    booksCarouselController.nextPage();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(16),
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    162,
                                    29,
                                    58,
                                  ),
                                ),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text(
                        books[_selectedIndex].author.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 24, 45),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        books[_selectedIndex].title.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 85, 85, 85),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ImgBookReadPage(book: books[_selectedIndex]),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 162, 29, 58),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'BACA TULISAN',
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent, // Removes button shadow
                    side: BorderSide(
                      color: Color.fromARGB(255, 162, 29, 58),
                      width: 2,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'LIHAT GALERI ARSIP LAINNYA',
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 162, 29, 58),
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
