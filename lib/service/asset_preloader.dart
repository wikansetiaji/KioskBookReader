// lib/utils/asset_preloader.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

class AssetPreloader {
  static int _totalAssets = 0;
  static int _loadedAssets = 0;
  static String _currentFile = '';
  static final StreamController<double> _progressController = StreamController<double>.broadcast();
  static final StreamController<String> _fileController = StreamController<String>.broadcast();

  static Stream<double> get progressStream => _progressController.stream;
  static Stream<String> get currentFileStream => _fileController.stream;

  static Future<void> preloadAssets() async {
    _totalAssets = 0;
    _loadedAssets = 0;
    _currentFile = '';
    
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final manifest = jsonDecode(manifestContent) as Map<String, dynamic>;

      // Get all assets from directories
      final directories = [
        'assets/pahesan/',
        'assets/tjehaja_sijang_0/',
        'assets/tjehaja_sijang_1/',
        'assets/tjehaja_sijang_2/',
        'assets/soenting_0/',
        'assets/soenting_1/',
        'assets/sedar/',
        'assets/soeara_iboe/',
        'assets/doenia_kita/',
        'assets/dunia_wanita/',
        'assets/kpwi/',
        'assets/authors/',
      ];

      // Count total assets
      _totalAssets = directories.fold(1, (sum, dir) => 
        sum + manifest.keys.where((key) => key.startsWith(dir)).length
      );

      // Load directory assets
      for (final dir in directories) {
        final assets = manifest.keys.where((key) => key.startsWith(dir)).toList();
        for (final asset in assets) {
          _updateProgress(asset);
          await rootBundle.load(asset);
        }
      }

      _progressController.close();
      _fileController.close();
    } catch (e) {
      debugPrint('Asset preload error: $e');
      rethrow;
    }
  }

  static void _updateProgress(String file) {
    _currentFile = file;
    _loadedAssets++;
    _fileController.add(_currentFile);
    _progressController.add(_loadedAssets / _totalAssets);
  }
}