import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookfx/bookfx.dart';
import 'package:kiosk_book_reader/components/book_info_widget.dart';
import 'package:kiosk_book_reader/components/language_toggle_switch.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';
import 'package:kiosk_book_reader/service/size_config.dart';
import 'package:provider/provider.dart';

class ImgBookReadPage extends StatefulWidget {
  final Book book;

  const ImgBookReadPage({super.key, required this.book});

  @override
  State<ImgBookReadPage> createState() => _ImgBookReadPageState();
}

class _ImgBookReadPageState extends State<ImgBookReadPage>
    with TickerProviderStateMixin {
  late BookController bookController;
  late AnimationController _animationController;
  Animation<Matrix4>? _animation;
  double? imgAspectRatio;
  bool isLoading = true;
  Size? firstImageSize;
  int currentPageIndex = 0;
  final TransformationController _transformationController =
      TransformationController();
  double _scale = 1.0;
  bool _isZoomed = false;
  double _bookHeight = 0;
  double _bookWidth = 0;
  double _mediaWidth = 0;
  double _mediaHeight = 0;
  bool _isShowHighlight = false;
  bool _isNavigating = false; // cater bookfx bug

  @override
  void initState() {
    super.initState();
    bookController = BookController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
      _transformationController.value = _animation!.value;
    });

    _loadFirstImageAspectRatio();
  }

  Future<void> _loadFirstImageAspectRatio() async {
    try {
      final ByteData data = await rootBundle.load(
        'assets/${widget.book.id}/1.webp',
      );
      final Uint8List bytes = data.buffer.asUint8List();
      final Image image = Image.memory(bytes);
      final completer = Completer<Size>();

      image.image
          .resolve(const ImageConfiguration())
          .addListener(
            ImageStreamListener(
              (ImageInfo info, bool _) {
                if (!completer.isCompleted) {
                  completer.complete(
                    Size(
                      info.image.width.toDouble(),
                      info.image.height.toDouble(),
                    ),
                  );
                }
              },
              onError: (Object error, StackTrace? stackTrace) {
                if (!completer.isCompleted) {
                  completer.completeError(error, stackTrace);
                }
              },
            ),
          );

      final Size size = await completer.future;
      if (mounted) {
        setState(() {
          firstImageSize = size;
          imgAspectRatio = size.width / size.height;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          imgAspectRatio = 1;
          isLoading = false;
        });
      }
    }
  }

  void _handleZoomReset() {
    final resetMatrix = Matrix4.identity();
    _animateTo(resetMatrix);
    setState(() {
      _scale = 1.0;
      _isZoomed = false;
    });
  }

  void _handleDoubleTap(BuildContext context, TapDownDetails details) {
    final position = details.localPosition;

    if (_isZoomed) {
      _handleZoomReset();
    } else {
      final scale = 2.0;

      final x = -position.dx * (scale - 1);
      final y = -position.dy * (scale - 1);

      final zoomed =
          Matrix4.identity()
            ..translate(x, y)
            ..scale(scale);

      _animateTo(zoomed);

      setState(() {
        _scale = scale;
        _isZoomed = true;
      });
    }
  }

  void _animateTo(Matrix4 target) {
    _animation = Matrix4Tween(
      begin: _transformationController.value,
      end: target,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward(from: 0);
  }

  void goToNextPage() {
    if (_isNavigating) return; // cater bookfx bug
    if (currentPageIndex + 1 < widget.book.numberOfPage) {
      bookController.next();
      setState(() {
        _isNavigating = true;
      });
      Future.delayed(const Duration(milliseconds: 800)).then((val) {
        setState(() {
          _isNavigating = false;
        });
      });
      if (_isZoomed) _handleZoomReset();
    }
  }

  void goToPreviousPage() {
    if (_isNavigating) return; // cater bookfx bug
    if (currentPageIndex > 0) {
      bookController.last();
      setState(() {
        _isNavigating = true;
      });
      Future.delayed(const Duration(milliseconds: 800)).then((val) {
        setState(() {
          currentPageIndex -= 1;
          _isNavigating = false;
        });
      });
      if (_isZoomed) _handleZoomReset();
    }
  }

  void showHighlight() {
    if (widget.book.highlights[0].page >= 0 &&
        widget.book.highlights[0].page < widget.book.numberOfPage + 1) {
      bookController.goTo(widget.book.highlights[0].page);
      setState(() {
        currentPageIndex = widget.book.highlights[0].page - 1;
      });
      if (_isZoomed) _handleZoomReset();

      final scale = 1.5;
      final zoomed =
          Matrix4.identity()
            ..scale(scale)
            ..translate(
              _bookWidth *
                      -(widget.book.highlights[0].centerX - (0.5 / scale)) -
                  ((_mediaWidth - _bookWidth) / scale) +
                  ((400.sc) / scale),
              _bookHeight *
                      -(widget.book.highlights[0].centerY - (0.5 / scale)) -
                  ((_mediaHeight - _bookHeight) / scale) -
                  ((120.sc) / scale),
            );
      _animateTo(zoomed);
      setState(() {
        _scale = scale;
        _isZoomed = true;
        _isShowHighlight = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

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
                      child: Row(
                        children: [
                          Icon(
                            Icons.chevron_left,
                            color: Color.fromARGB(255, 162, 29, 58),
                            size: 40.sc,
                          ),
                          Text(
                            context.watch<LanguageProvider>().isEnglish
                                ? 'BACK'
                                : 'KEMBALI',
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 162, 29, 58),
                              fontSize: 32.sc,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    LanguageToggleSwitch(),
                    SizedBox(width: 40.sc),
                  ],
                ),
                SizedBox(height: 40.sc),
                Expanded(
                  flex: 43,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.sc),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.sc),
                      child: Container(
                        color:
                            _isZoomed
                                ? const Color.fromARGB(43, 0, 0, 0)
                                : null,
                        child: GestureDetector(
                          onDoubleTapDown:
                              (details) => _handleDoubleTap(context, details),
                          child: InteractiveViewer(
                            transformationController: _transformationController,
                            minScale: 1.0,
                            maxScale: 3.0,
                            panEnabled: _isZoomed,
                            scaleEnabled: true,
                            boundaryMargin: EdgeInsets.all(20.sc),
                            onInteractionUpdate: (details) {
                              final newScale =
                                  _transformationController.value
                                      .getMaxScaleOnAxis();
                              setState(() {
                                _scale = newScale;
                                _isZoomed = newScale != 1.0;
                              });
                            },
                            child: Column(
                              children: [
                                Opacity(
                                  opacity: _isZoomed ? 0.0 : 1.0,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 60.sc),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${widget.book.getType(context).toUpperCase()} ${widget.book.title.toUpperCase()}',
                                            style: TextStyle(
                                              fontFamily: 'Archivo',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24.sc,
                                              color: Color.fromARGB(
                                                255,
                                                85,
                                                85,
                                                85,
                                              ),
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          if (widget.book.edition != null)
                                            Text(
                                              widget.book
                                                  .getEdition(context)!
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                fontFamily: 'Archivo',
                                                fontSize: 16.sc,
                                                color: Color.fromARGB(
                                                  255,
                                                  85,
                                                  85,
                                                  85,
                                                ),
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          Text(
                                            widget.book
                                                .getDate(context)
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontFamily: 'Archivo',
                                              fontSize: 16.sc,
                                              color: Color.fromARGB(
                                                255,
                                                162,
                                                29,
                                                58,
                                              ),
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40.0.sc,
                                      vertical: 20.0.sc,
                                    ),
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        final screenSize = constraints.biggest;
                                        final maxHeight = screenSize.height;
                                        final maxWidth = screenSize.width;

                                        double bookWidth = min(
                                          maxWidth,
                                          maxHeight * imgAspectRatio!,
                                        );
                                        double bookHeight =
                                            bookWidth / imgAspectRatio!;

                                        if (bookHeight > maxHeight) {
                                          bookHeight = maxHeight;
                                          bookWidth =
                                              bookHeight * imgAspectRatio!;
                                        }

                                        _bookHeight = bookHeight;
                                        _bookWidth = bookWidth;
                                        _mediaWidth = screenSize.width;
                                        _mediaHeight = screenSize.height;

                                        return Stack(
                                          children: [
                                            Center(
                                              child: GestureDetector(
                                                onTapDown: (
                                                  TapDownDetails details,
                                                ) {
                                                  print(
                                                    'Tapped at relative: (${details.localPosition.dx / bookWidth},${details.localPosition.dy / bookHeight})',
                                                  );
                                                },
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: bookWidth,
                                                      height: bookHeight,
                                                      child: AbsorbPointer(
                                                        absorbing: _isZoomed,
                                                        child: BookFx(
                                                          currentBgColor:
                                                              const Color.fromARGB(
                                                                255,
                                                                214,
                                                                187,
                                                                135,
                                                              ),
                                                          size: Size(
                                                            bookWidth,
                                                            bookHeight,
                                                          ),
                                                          pageCount:
                                                              widget
                                                                  .book
                                                                  .numberOfPage,
                                                          currentPage:
                                                              (index) =>
                                                                  _buildBookPage(
                                                                    index,
                                                                    bookWidth,
                                                                    bookHeight,
                                                                  ),
                                                          nextPage:
                                                              (index) =>
                                                                  _buildBookPage(
                                                                    index,
                                                                    bookWidth,
                                                                    bookHeight,
                                                                  ),
                                                          controller:
                                                              bookController,
                                                          nextCallBack: (
                                                            index,
                                                          ) {
                                                            setState(() {
                                                              currentPageIndex =
                                                                  index - 1;
                                                            });
                                                          },
                                                          lastCallBack: (
                                                            index,
                                                          ) {
                                                            if (index > 0) {
                                                              setState(() {
                                                                currentPageIndex =
                                                                    index - 1;
                                                              });
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    if (_isShowHighlight &&
                                                        widget.book.highlights
                                                            .where(
                                                              (highlight) =>
                                                                  highlight
                                                                      .page ==
                                                                  currentPageIndex +
                                                                      1,
                                                            )
                                                            .toList()
                                                            .isNotEmpty &&
                                                        !_isNavigating)
                                                      for (var highlight
                                                          in widget
                                                              .book
                                                              .highlights
                                                              .where(
                                                                (highlight) =>
                                                                    highlight
                                                                        .page ==
                                                                    currentPageIndex +
                                                                        1,
                                                              )
                                                              .toList())
                                                        Positioned(
                                                          left:
                                                              highlight
                                                                      .centerX *
                                                                  bookWidth -
                                                              ((highlight.width /
                                                                      2) *
                                                                  bookWidth),
                                                          top:
                                                              highlight
                                                                      .centerY *
                                                                  bookHeight -
                                                              ((highlight.height /
                                                                      2) *
                                                                  bookHeight),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                  Radius.circular(
                                                                    10.sc,
                                                                  ),
                                                                ),
                                                            child: Container(
                                                              color:
                                                                  Color.fromARGB(
                                                                    80,
                                                                    238,
                                                                    245,
                                                                    145,
                                                                  ),
                                                              width:
                                                                  highlight
                                                                      .width *
                                                                  bookWidth,
                                                              height:
                                                                  highlight
                                                                      .height *
                                                                  bookHeight,
                                                            ),
                                                          ),
                                                        ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.sc),
                Row(
                  children: [
                    SizedBox(width: 16.sc),
                    if (_isZoomed)
                      ElevatedButton(
                        onPressed: _handleZoomReset,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(14.sc),
                          backgroundColor: Color.fromARGB(255, 85, 85, 85),
                          foregroundColor: Colors.white,
                        ),
                        child: Icon(Icons.zoom_out, size: 48.sc),
                      ),
                    if (!_isZoomed)
                      ElevatedButton(
                        onPressed: () {
                          final scale = 2.0;
                          final zoomed =
                              Matrix4.identity()
                                ..translate(
                                  _mediaWidth / 2 * -1,
                                  _mediaHeight / 2 * -1,
                                )
                                ..scale(scale);
                          _animateTo(zoomed);
                          setState(() {
                            _scale = scale;
                            _isZoomed = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(14.sc),
                          backgroundColor: Color.fromARGB(255, 85, 85, 85),
                          foregroundColor: Colors.white,
                        ),
                        child: Icon(Icons.zoom_in, size: 48.sc),
                      ),
                    Text(
                      '${(_scale * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontFamily: 'PublicSans',
                        color: Color.fromARGB(255, 85, 85, 85),
                        fontSize: 20.sc,
                      ),
                    ),
                    Expanded(child: Container()),
                    _buildNavButton(
                      context,
                      icon: Icons.chevron_left,
                      onPressed: goToPreviousPage,
                      enabled: currentPageIndex > 0 && !_isNavigating,
                    ),
                    SizedBox(width: 20.sc),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.sc),
                      child: Container(
                        color: Color.fromARGB(255, 85, 85, 85),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.sc,
                          vertical: 10.sc,
                        ),
                        child: Text(
                          '${currentPageIndex + 1} / ${widget.book.numberOfPage}',
                          style: TextStyle(
                            fontFamily: 'PublicSans',
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20.sc,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.sc),
                    _buildNavButton(
                      context,
                      icon: Icons.chevron_right,
                      onPressed: goToNextPage,
                      enabled: currentPageIndex + 1 < widget.book.numberOfPage,
                    ),
                    Expanded(child: Container()),
                    SizedBox(width: 72.sc),
                  ],
                ),
                SizedBox(height: 20.sc),
                BookInfoWidget(
                  book: widget.book,
                  onShowHighlight: () {
                    if (widget.book.highlights.isNotEmpty) {
                      showHighlight();
                    }
                  },
                ),
                SizedBox(height: 20.sc),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookPage(int index, double width, double height) {
    return SizedBox(
      key: ValueKey(index),
      width: width,
      height: height,
      child: Image.asset(
        'assets/${widget.book.id}/$index.webp',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
    bool enabled = true,
  }) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.all(14.sc),
        backgroundColor: Color.fromARGB(255, 85, 85, 85),
        foregroundColor: Colors.white,
      ),
      child: Icon(icon, size: 48.sc),
    );
  }
}
