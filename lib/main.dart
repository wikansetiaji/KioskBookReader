import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/pages/home_page.dart';
import 'package:kiosk_book_reader/service/idle_timer.dart';
import 'package:kiosk_book_reader/service/size_config.dart';
import 'package:window_size/window_size.dart';

void main() {
  final double width = 1080;
  final double height = 1920;
  WidgetsFlutterBinding.ensureInitialized();
  setWindowTitle('Muara Kiosk Book Reader');

  if (!Platform.isWindows) {
    setWindowMinSize(Size(width, height));
    setWindowMaxSize(Size(width, height));
    setWindowFrame(
      Rect.fromLTWH(100, 100, width, height),
    ); // <== Simulated resolution
  }

  runApp(
    Transform.scale(
      scale: !Platform.isWindows ? 0.72 : 1, // Show at 50% size
      alignment: Alignment.topLeft,
      child: const KioskBookReaderApp(),
    ),
  );
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
