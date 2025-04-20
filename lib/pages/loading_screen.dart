// lib/widgets/loading_screen.dart
import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/service/asset_preloader.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildProgressIndicator(),
              const SizedBox(height: 20),
              _buildCurrentFileText(),
              const SizedBox(height: 20),
              _buildPercentageText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return StreamBuilder<double>(
      stream: AssetPreloader.progressStream,
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0;
        return SizedBox(
          width: 200,
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            backgroundColor: Colors.grey[800],
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }

  Widget _buildCurrentFileText() {
    return StreamBuilder<String>(
      stream: AssetPreloader.currentFileStream,
      builder: (context, snapshot) {
        return Text(
          snapshot.data ?? 'Preparing...',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }

  Widget _buildPercentageText() {
    return StreamBuilder<double>(
      stream: AssetPreloader.progressStream,
      builder: (context, snapshot) {
        final percent = ((snapshot.data ?? 0) * 100).toStringAsFixed(1);
        return Text(
          '$percent%',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        );
      },
    );
  }
}