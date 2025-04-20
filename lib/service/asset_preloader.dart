import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetPreloader {
  static Future<void> preloadAssets() async {
    try {
      // PDFs
      await rootBundle.load('assets/sample.pdf');
      
      // Image directories
      await Future.wait([
        _preloadDirectory('assets/pahesan/'),
        _preloadDirectory('assets/tjehaja_sijang_0/'),
        _preloadDirectory('assets/tjehaja_sijang_1/'),
        _preloadDirectory('assets/tjehaja_sijang_2/'),
        _preloadDirectory('assets/soenting_0/'),
        _preloadDirectory('assets/soenting_1/'),
        _preloadDirectory('assets/sedar/'),
        _preloadDirectory('assets/soeara_iboe/'),
        _preloadDirectory('assets/doenia_kita/'),
        _preloadDirectory('assets/dunia_wanita/'),
        _preloadDirectory('assets/kpwi/'),
        _preloadDirectory('assets/authors/'),
      ]);

      debugPrint('✅ All assets preloaded successfully');
    } catch (e) {
      debugPrint('⚠️ Error preloading assets: $e');
    }
  }

  static Future<void> _preloadDirectory(String path) async {
    final manifest = await rootBundle.loadString('AssetManifest.json');
    final json = jsonDecode(manifest) as Map<String, dynamic>;
    
    final assets = json.keys
        .where((asset) => asset.startsWith(path))
        .toList();

    await Future.wait(assets.map((asset) => rootBundle.load(asset)));
  }
}