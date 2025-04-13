import 'dart:async'; // Add this import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'package:bookfx/bookfx.dart';

class ImgBookReadPage extends StatefulWidget {
  const ImgBookReadPage({super.key});

  @override
  State<ImgBookReadPage> createState() => _ImgBookReadPageState();
}

class _ImgBookReadPageState extends State<ImgBookReadPage> {
  late BookController bookController;
  double? imgAspectRatio;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    bookController = BookController();
    _loadFirstImageAspectRatio();
  }

  Future<void> _loadFirstImageAspectRatio() async {
    try {
      final ByteData data = await rootBundle.load('assets/tjahaja_siang/1.jpg');
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

  @override
  void dispose() {
    bookController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final bookWidth = screenHeight * imgAspectRatio!;
    final bookLeftOffset = (screenWidth - bookWidth) / 2;

    void goToNextPage() {
      if (bookController.currentIndex + 1 < 12) {
        bookController.next();
      }
    }

    void goToPreviousPage() {
      if (bookController.currentIndex > 0) {
        bookController.last();
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: BookFx(
              currentBgColor: Color.fromARGB(255, 214, 187, 135),
              size: Size(bookWidth, screenHeight),
              pageCount: 13,
              currentPage: (index) {
                return Image.asset(
                  'assets/tjahaja_siang/$index.jpg',
                  fit: BoxFit.fill,
                  height: screenHeight,
                );
              },
              nextPage: (index) {
                return Image.asset(
                  'assets/tjahaja_siang/$index.jpg',
                  fit: BoxFit.fill,
                  height: screenHeight,
                );
              },
              controller: bookController,
            ),
          ),

          // Back floating button
          Positioned(
            top: 40,
            left: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black.withOpacity(0.6),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),

          // Previous Button (Left of PDF)
          Positioned(
            left: bookLeftOffset - 70,
            top: screenHeight / 2 - 35,
            child: ElevatedButton(
              onPressed: goToPreviousPage,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(18),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
              child: const Icon(Icons.chevron_left, size: 36),
            ),
          ),

          // Next Button (Right of PDF)
          Positioned(
            right: bookLeftOffset - 70,
            top: screenHeight / 2 - 35,
            child: ElevatedButton(
              onPressed: goToNextPage,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(18),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
              child: const Icon(Icons.chevron_right, size: 36),
            ),
          ),
        ],
      ),
    );
  }
}
