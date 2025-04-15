import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/components/book_list_widget.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/repository/books_repository.dart';

class BookFilterPage extends StatefulWidget {
  const BookFilterPage({super.key});

  @override
  State<BookFilterPage> createState() => _BookFilterPageState();
}

class _BookFilterPageState extends State<BookFilterPage> {
  bool _isDrawerOpened = false;
  bool _isDrawerVisible = false;

  final BooksRepository booksRepository = BooksRepository();

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

                  Expanded(
                    flex: 25,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0, left: 40.0, right: 40.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Expanded(
                            flex: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                color: Color.fromARGB(255, 254, 250, 242),
                                child: Image.asset(
                                  'assets/authors/maramis.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
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
                                          'Maria Walanda Maramis, lahir di Sulawesi Utara pada 1 Desember 1872, adalah pelopor emansipasi perempuan yang menekankan peran ibu dalam keluarga dan pendidikan anak. Ia mendirikan PIKAT dan Sekolah Rumah Tangga (Huishold School) untuk pendidikan gratis untuk anak-anak perempuan, menulis di Tjehaja Sijang, dan memperjuangkan hak politik perempuan lewat kampanye surat ke Batavia.',
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
                  ),

                  Expanded(flex: 70, child: BookListWidget(books: booksRepository.getAllBooks(),)),
                ],
              ),
              if (_isDrawerOpened)
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      _isDrawerOpened = false;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              drawerWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerWidget() {
    return AnimatedSlide(
      duration: Duration(milliseconds: 300),
      offset: _isDrawerOpened ? Offset.zero : Offset(-1 / 2, 0),
      onEnd: () {
        setState(() {
          if (!_isDrawerOpened) {
            _isDrawerVisible = _isDrawerOpened;
          }
        });
      },
      child: Row(
        children: [
          Visibility(
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            visible: _isDrawerVisible,
            child: Container(
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
            ),
          ),
          Column(
            children: [
              Expanded(flex: 30, child: Container()),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!_isDrawerOpened) {
                        _isDrawerVisible = true;
                      }
                      _isDrawerOpened = !_isDrawerOpened;
                    });
                  },
                  child: Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 2,
                      ),
                      color: Color.fromARGB(255, 162, 29, 58),
                      child: Icon(
                        _isDrawerOpened
                            ? Icons.chevron_left
                            : Icons.chevron_right,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 70, child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
