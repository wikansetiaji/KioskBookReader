import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/pages/home_page.dart';
import 'package:kiosk_book_reader/service/idle_timer.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';
import 'package:kiosk_book_reader/service/size_config.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setWindowTitle('Kartini Kiosk Book Reader');

  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: Transform.scale(
        scale: 1, // Show at 50% size
        alignment: Alignment.topLeft,
        child: const KioskBookReaderApp(),
      ),
    ),
  );

  if (Platform.isWindows) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setFullScreen(true);
      await windowManager.center();
      await windowManager.show();
      await windowManager.setSkipTaskbar(false);
    });
  }
}

class KioskBookReaderApp extends StatelessWidget {
  const KioskBookReaderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late IdleTimer _idleTimer;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _idleTimer = IdleTimer(
      timeout: Duration(minutes: 10),
      onTimeout: _onIdleTimeout,
    );
    _idleTimer.reset();
  }

  void _onIdleTimeout() {
    final context = _navigatorKey.currentContext;
    if (context != null) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  void _onUserInteraction() {
    _idleTimer.reset();
  }

  @override
  void dispose() {
    _idleTimer.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Listener(
      onPointerDown: (_) => _onUserInteraction(),
      behavior: HitTestBehavior.translucent,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        home: HomePage(title: ""),
      ),
    );
  }
}
