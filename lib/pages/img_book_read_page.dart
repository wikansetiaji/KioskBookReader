import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookfx/bookfx.dart';
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
      final scale = 2.8;

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

  @override
  void dispose() {
    bookController.dispose();
    _animationController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (currentPageIndex + 1 < widget.book.numberOfPage) {
      bookController.next();
      if (_isZoomed) _handleZoomReset();
    }
  }

  void goToPreviousPage() {
    if (currentPageIndex > 0) {
      bookController.last();
      setState(() {
        currentPageIndex -= 1;
      });
      if (_isZoomed) _handleZoomReset();
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
            Image.asset('assets/bg-texture.png', fit: BoxFit.fill),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: const Color.fromARGB(43, 0, 0, 0),
                        padding: EdgeInsets.all(20),
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

                            return Stack(
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTapDown: (TapDownDetails details) {
                                      final box =
                                          context.findRenderObject()
                                              as RenderBox;
                                      final localPosition = box.globalToLocal(
                                        details.globalPosition,
                                      );

                                      final relativeX =
                                          localPosition.dx / box.size.width;
                                      final relativeY =
                                          localPosition.dy / box.size.height;

                                      print(
                                        'Tapped at: $relativeX, $relativeY (relative)',
                                      );
                                    },
                                    onDoubleTapDown:
                                        (details) =>
                                            _handleDoubleTap(context, details),
                                    child: InteractiveViewer(
                                      transformationController:
                                          _transformationController,
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
                                      child: SizedBox(
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
                                            size: Size(bookWidth, bookHeight),
                                            pageCount: widget.book.numberOfPage,
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
                                                currentPageIndex = index - 1;
                                              });
                                            },
                                            lastCallBack: (index) {
                                              if (index > 0) {
                                                setState(() {
                                                  currentPageIndex = index - 1;
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ),
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
                          final scale = 2.8;
                          final zoomed =
                              Matrix4.identity()
                                ..translate(_bookWidth * -1, _bookHeight * -1)
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
                      enabled: currentPageIndex > 0,
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
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      spacing: 15,
                      children: [
                        Expanded(
                          child: Column(
                            spacing: 15,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    color: Color.fromARGB(255, 255, 239, 212),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '“DJEMPOETAN BAGI BANGSA PEREMPUAN”',
                                          style: const TextStyle(
                                            fontFamily: 'Archivo',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor:
                                                    Colors
                                                        .transparent, // Removes button shadow
                                                side: BorderSide(
                                                  color: Color.fromARGB(
                                                    255,
                                                    162,
                                                    29,
                                                    58,
                                                  ),
                                                  width: 2,
                                                ),
                                              ),
                                              child: Text(
                                                'LIHAT TAJUK TULISAN ASLI >',
                                                style: TextStyle(
                                                  fontFamily: 'Archivo',
                                                  color: Color.fromARGB(
                                                    255,
                                                    162,
                                                    29,
                                                    58,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Expanded(
                                          child: Scrollbar(
                                            thumbVisibility: true,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16),
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'BACA EDISI LAINNYA,',
                                        style: const TextStyle(
                                          fontFamily: 'Archivo',
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                            255,
                                            119,
                                            24,
                                            45,
                                          ),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            spacing: 15,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/authors/maramis.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    color: Color.fromARGB(255, 255, 239, 212),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'LATAR BELAKANG',
                                          style: const TextStyle(
                                            fontFamily: 'Archivo',
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              119,
                                              24,
                                              45,
                                            ),
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Expanded(
                                          child: Scrollbar(
                                            thumbVisibility: true,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
