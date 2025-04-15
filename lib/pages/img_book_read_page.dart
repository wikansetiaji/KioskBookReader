import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookfx/bookfx.dart';
import 'package:kiosk_book_reader/components/book_info_widget.dart';
import 'package:kiosk_book_reader/models/book.dart';

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
        'assets/${widget.book.id}/1.jpg',
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
      Future.delayed(const Duration(milliseconds: 600)).then((val) {
        setState(() {
          _isNavigating = false;
        });
      });
      setState(() {
        _isShowHighlight = false;
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
      Future.delayed(const Duration(milliseconds: 600)).then((val) {
        setState(() {
          currentPageIndex -= 1;
          _isShowHighlight = false;
          _isNavigating = false;
        });
      });
      if (_isZoomed) _handleZoomReset();
    }
  }

  void showHighlight() {
    if (widget.book.highlight!.page >= 0 &&
        widget.book.highlight!.page < widget.book.numberOfPage) {
      bookController.goTo(widget.book.highlight!.page);
      setState(() {
        currentPageIndex = widget.book.highlight!.page - 1;
      });
      if (_isZoomed) _handleZoomReset();

      final scale = 2.0;
      final zoomed =
          Matrix4.identity()
            ..scale(scale)
            ..translate(
              _bookWidth * -(widget.book.highlight!.centerX - (0.5 / scale)) - ((_mediaWidth - _bookWidth) / scale),
              _bookHeight * -(widget.book.highlight!.centerY - (0.5 / scale) ),
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
                SizedBox(height: 20),
                Expanded(
                  flex: 43,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: _isZoomed ? const Color.fromARGB(43, 0, 0, 0) : null,
                        child: GestureDetector(
                          onDoubleTapDown:
                              (details) => _handleDoubleTap(context, details),
                          child: InteractiveViewer(
                            transformationController: _transformationController,
                            minScale: 1.0,
                            maxScale: 3.0,
                            panEnabled: _isZoomed,
                            scaleEnabled: true,
                            boundaryMargin: const EdgeInsets.all(20),
                            onInteractionUpdate: (details) {
                              final newScale =
                                  _transformationController.value
                                      .getMaxScaleOnAxis();
                              setState(() {
                                _scale = newScale;
                                _isZoomed = newScale != 1.0;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final screenSize = constraints.biggest;
                                  final maxHeight = screenSize.height;
                                  final maxWidth = screenSize.width;
                              
                                  double bookWidth = min(
                                    maxWidth,
                                    maxHeight * imgAspectRatio!,
                                  );
                                  double bookHeight = bookWidth / imgAspectRatio!;
                              
                                  if (bookHeight > maxHeight) {
                                    bookHeight = maxHeight;
                                    bookWidth = bookHeight * imgAspectRatio!;
                                  }
                              
                                  _bookHeight = bookHeight;
                                  _bookWidth = bookWidth;
                                  _mediaWidth = screenSize.width;
                              
                                  return Stack(
                                    children: [
                                      Center(
                                        child: GestureDetector(
                                          onTapDown: (TapDownDetails details) {
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
                                                        widget.book.numberOfPage,
                                                    currentPage:
                                                        (index) => _buildBookPage(
                                                          index,
                                                          bookWidth,
                                                          bookHeight,
                                                        ),
                                                    nextPage:
                                                        (index) => _buildBookPage(
                                                          index,
                                                          bookWidth,
                                                          bookHeight,
                                                        ),
                                                    controller: bookController,
                                                    nextCallBack: (index) {
                                                      setState(() {
                                                        _isShowHighlight = false;
                                                        currentPageIndex =
                                                            index - 1;
                                                      });
                                                    },
                                                    lastCallBack: (index) {
                                                      if (index > 0) {
                                                        setState(() {
                                                          _isShowHighlight =
                                                              false;
                                                          currentPageIndex =
                                                              index - 1;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              if (_isShowHighlight)
                                                Positioned(
                                                  left:
                                                      widget
                                                              .book
                                                              .highlight!
                                                              .centerX *
                                                          bookWidth -
                                                      ((widget
                                                                  .book
                                                                  .highlight!
                                                                  .width /
                                                              2) *
                                                          bookWidth),
                                                  top:
                                                      widget
                                                              .book
                                                              .highlight!
                                                              .centerY *
                                                          bookHeight -
                                                      ((widget
                                                                  .book
                                                                  .highlight!
                                                                  .height /
                                                              2) *
                                                          bookHeight),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                    child: Container(
                                                      color: Color.fromARGB(
                                                        80,
                                                        238,
                                                        245,
                                                        145,
                                                      ),
                                                      width:
                                                          widget
                                                              .book
                                                              .highlight!
                                                              .width *
                                                          bookWidth,
                                                      height:
                                                          widget
                                                              .book
                                                              .highlight!
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
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 16),
                    if (_isZoomed)
                      ElevatedButton(
                        onPressed: _handleZoomReset,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(14),
                          backgroundColor: Color.fromARGB(255, 85, 85, 85),
                          foregroundColor: Colors.white,
                        ),
                        child: Icon(Icons.zoom_out, size: 28),
                      ),
                    if (!_isZoomed)
                      ElevatedButton(
                        onPressed: () {
                          final scale = 2.0;
                          final zoomed =
                              Matrix4.identity()
                                ..translate(
                                  _bookWidth / 2 * -1,
                                  _bookHeight / 2 * -1,
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
                          padding: const EdgeInsets.all(14),
                          backgroundColor: Color.fromARGB(255, 85, 85, 85),
                          foregroundColor: Colors.white,
                        ),
                        child: Icon(Icons.zoom_in, size: 28),
                      ),
                    Text(
                      '${(_scale * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontFamily: 'PublicSans',
                        color: Color.fromARGB(255, 85, 85, 85),
                      ),
                    ),
                    Expanded(child: Container()),
                    _buildNavButton(
                      context,
                      icon: Icons.chevron_left,
                      onPressed: goToPreviousPage,
                      enabled: currentPageIndex > 0 && !_isNavigating,
                    ),
                    const SizedBox(width: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Color.fromARGB(255, 85, 85, 85),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Text(
                          '${currentPageIndex + 1} / ${widget.book.numberOfPage}',
                          style: const TextStyle(
                            fontFamily: 'PublicSans',
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    _buildNavButton(
                      context,
                      icon: Icons.chevron_right,
                      onPressed: goToNextPage,
                      enabled: currentPageIndex + 1 < widget.book.numberOfPage,
                    ),
                    Expanded(child: Container()),
                    SizedBox(width: 72),
                  ],
                ),
                SizedBox(height: 20),
                BookInfoWidget(
                  book: widget.book,
                  onShowHighlight: () {
                    if (widget.book.highlight != null) {
                      showHighlight();
                    }
                  },
                ),
                SizedBox(height: 20),
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
        'assets/${widget.book.id}/$index.jpg',
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
        padding: const EdgeInsets.all(14),
        backgroundColor: Color.fromARGB(255, 85, 85, 85),
        foregroundColor: Colors.white,
      ),
      child: Icon(icon, size: 28),
    );
  }
}
