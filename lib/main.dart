import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/pages/home_page.dart';
import 'package:kiosk_book_reader/service/idle_timer.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    setWindowTitle('My Flutter Desktop App');
    setWindowMinSize(const Size(1080, 1920));
    setWindowMaxSize(const Size(1080, 1920));
    setWindowFrame(
      const Rect.fromLTWH(100, 100, 1080, 1920),
    ); // <== Simulated resolution
  }

  runApp(
    Transform.scale(
      scale: 0.5, // Show at 50% size
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
