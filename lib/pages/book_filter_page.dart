import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/components/author_info_content_widget.dart';
import 'package:kiosk_book_reader/components/author_info_widget.dart';
import 'package:kiosk_book_reader/components/book_list_widget.dart';
import 'package:kiosk_book_reader/components/filter_drawer_widget.dart';
import 'package:kiosk_book_reader/components/language_toggle_switch.dart';
import 'package:kiosk_book_reader/models/author.dart';
import 'package:kiosk_book_reader/repository/books_repository.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';
import 'package:kiosk_book_reader/service/size_config.dart';
import 'package:provider/provider.dart';

class BookFilterPage extends StatefulWidget {
  const BookFilterPage({super.key});

  @override
  State<BookFilterPage> createState() => _BookFilterPageState();
}

class _BookFilterPageState extends State<BookFilterPage> {
  bool _isDrawerOpened = false;
  bool _isDrawerVisible = false;
  Author? _selectedAuthor;

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
                    height: 200.sc,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 40.sc),
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
                            horizontal: 24.sc,
                            vertical: 12.sc,
                          ),
                        ),
                        child: Text(
                          context.watch<LanguageProvider>().isEnglish
                              ? '< BACK'
                              : '< KEMBALI',
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 162, 29, 58),
                            fontSize: 32.sc,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      LanguageToggleSwitch(),
                      SizedBox(width: 40.sc),
                    ],
                  ),

                  SizedBox(height: 40.sc),

                  // Start scroll from here
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            context.watch<LanguageProvider>().isEnglish
                                ? 'DIGITAL ARCHIVE'
                                : 'ARSIP DIGITAL',
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: 28.sc,
                              color: Color.fromARGB(255, 85, 85, 85),
                              letterSpacing: -0.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.sc),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              if (_selectedAuthor == null)
                                Row(
                                  children: [
                                    Text(
                                      context
                                              .watch<LanguageProvider>()
                                              .isEnglish
                                          ? 'WRITINGS OF'
                                          : 'TULISAN KARYA',
                                      style: TextStyle(
                                        fontFamily: 'Archivo',
                                        fontSize: 42.sc,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 85, 85, 85),
                                        letterSpacing: -1.5,
                                        height: 0.8,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(width: 20.sc),
                                  ],
                                ),
                              Text(
                                _selectedAuthor == null
                                    ? context
                                            .watch<LanguageProvider>()
                                            .isEnglish
                                        ? 'ALL WOMEN WRITERS'
                                        : 'SEMUA PENULIS WANITA'
                                    : _selectedAuthor!.contentTitle!.toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  fontSize: 42.sc,
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

                          SizedBox(height: 40.sc),

                          if (_selectedAuthor != null)
                            Column(
                              children: [
                                if (!_selectedAuthor!.isMediaAuthor && _selectedAuthor?.background != null)
                                  AuthorInfoWidget(author: _selectedAuthor!),

                                if (_selectedAuthor?.contentDescription != null)
                                  AuthorInfoContentWidget(
                                    author: _selectedAuthor!,
                                  ),

                                if (_selectedAuthor!.isMediaAuthor && _selectedAuthor?.background != null)
                                  AuthorInfoWidget(author: _selectedAuthor!),
                              ],
                            ),

                          SizedBox(
                            child: BookListWidget(
                              books:
                                  _selectedAuthor == null
                                      ? booksRepository.getAllBooks(showEditions: true) 
                                      : booksRepository.getBooksFromAuthor(
                                        author: _selectedAuthor!,
                                        showEditions: true,
                                      ),
                            ),
                          ),
                          // until here
                        ],
                      ),
                    ),
                  ),
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
            child: FilterDrawerWidget(
              context: context,
              onSelectAuthor: (author) {
                setState(() {
                  _selectedAuthor = author;
                  _isDrawerOpened = false;
                });
              },
            ),
          ),
          Column(
            children: [
              Expanded(flex: 30, child: Container()),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.sc),
                  bottomRight: Radius.circular(10.sc),
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
                        vertical: 40.sc,
                        horizontal: 10.sc,
                      ),
                      color: Color.fromARGB(255, 162, 29, 58),
                      child: Icon(
                        _isDrawerOpened
                            ? Icons.chevron_left
                            : Icons.chevron_right,
                        color: Colors.white,
                        size: 60.sc,
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
