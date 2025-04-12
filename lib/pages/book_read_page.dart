import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:http/http.dart' as http;
import 'package:bookfx/bookfx.dart';

class BookReadPage extends StatefulWidget {
  const BookReadPage({super.key});

  @override
  State<BookReadPage> createState() => _BookReadPageState();
}

class _BookReadPageState extends State<BookReadPage> {
  PdfDocument? _document;
  bool _isLoading = true;
  late BookController bookController;
  double? pdfAspectRatio;

  @override
  void initState() {
    super.initState();
    bookController = BookController();
    _loadDocument();
  }

  @override
  void dispose() {
    bookController.dispose();
    super.dispose();
  }

  Future<void> _loadDocument() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://www.thebookcollector.co.uk/sites/default/files/the-book-collector-example-2023-01.pdf',
        ),
      );

      if (response.statusCode == 200) {
        final document = await PdfDocument.openData(response.bodyBytes);

        final page = document.pages[0];
        final width = page.width;
        final height = page.height;

        setState(() {
          _document = document;
          pdfAspectRatio = width / height;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load PDF: HTTP ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      debugPrint('Error loading PDF: $e');
    }
  }

  void _goToNextPage() {
    if (bookController.currentIndex + 1 < (_document!.pages.length - 1)) {
      bookController.next();
    }
  }

  void _goToPreviousPage() {
    if (bookController.currentIndex + 1 > 0) {
      bookController.last();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_document == null || pdfAspectRatio == null) {
      return const Scaffold(body: Center(child: Text('Failed to load PDF')));
    }

    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final bookWidth = screenHeight * pdfAspectRatio!;
    final bookLeftOffset = (screenWidth - bookWidth) / 2;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: BookFx(
              size: Size(bookWidth, screenHeight),
              pageCount: _document!.pages.length,
              currentPage: (index) {
                return PdfPageView(
                  key: ValueKey("current-$index"),
                  document: _document!,
                  pageNumber: index + 1,
                  alignment: Alignment.center,
                );
              },
              nextPage: (index) {
                return PdfPageView(
                  key: ValueKey("next-$index"),
                  document: _document!,
                  pageNumber: index + 1,
                  alignment: Alignment.center,
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
              onPressed: _goToPreviousPage,
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
              onPressed: _goToNextPage,
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
