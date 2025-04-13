import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
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
    bookController.addListener(_updateCurrentPage);
  }

  void _updateCurrentPage() {
    setState(() {
      currentPageIndex = bookController.currentIndex;
    });
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
      final renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;

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
    bookController.removeListener(_updateCurrentPage);
    bookController.dispose();
    _animationController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenSize = constraints.biggest;
            final maxHeight = screenSize.height;
            final maxWidth = screenSize.width;

            double bookWidth = min(maxWidth, maxHeight * imgAspectRatio!);
            double bookHeight = bookWidth / imgAspectRatio!;

            if (bookHeight > maxHeight) {
              bookHeight = maxHeight;
              bookWidth = bookHeight * imgAspectRatio!;
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
                if (_isZoomed) _handleZoomReset();
              }
            }

            return Stack(
              children: [
                Center(
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
                            _transformationController.value.getMaxScaleOnAxis();
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
                            currentBgColor: const Color.fromARGB(
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
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Back button
                Positioned(
                  top: 8,
                  left: 8,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.black.withOpacity(0.6),
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),

                // Reset zoom
                if (_isZoomed)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.black.withOpacity(0.6),
                      onPressed: _handleZoomReset,
                      child: const Icon(
                        Icons.fullscreen_exit,
                        color: Colors.white,
                      ),
                    ),
                  ),

                // Side nav
                if (bookWidth < maxWidth - 32 && !_isZoomed) ...[
                  Positioned(
                    left: max(8.0, (maxWidth - bookWidth) / 4),
                    top: (maxHeight / 2) - 28,
                    child: _buildNavButton(
                      context,
                      icon: Icons.chevron_left,
                      onPressed: goToPreviousPage,
                    ),
                  ),
                  Positioned(
                    right: max(8.0, (maxWidth - bookWidth) / 4),
                    top: (maxHeight / 2) - 28,
                    child: _buildNavButton(
                      context,
                      icon: Icons.chevron_right,
                      onPressed: goToNextPage,
                    ),
                  ),
                ],

                // Bottom nav
                if (bookWidth >= maxWidth - 32)
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildNavButton(
                          context,
                          icon: Icons.chevron_left,
                          onPressed: goToPreviousPage,
                        ),
                        const SizedBox(width: 20),
                        _buildNavButton(
                          context,
                          icon: Icons.chevron_right,
                          onPressed: goToNextPage,
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
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
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(14),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      child: Icon(icon, size: 28),
    );
  }
}
