import 'package:flutter/material.dart';
import 'config/environment.dart';
import 'screens/screens.dart';

Future<void> main() async {
  // Load environment configuration
  await Environment.load();
  runApp(const DoubaoWebViewApp());
}

/// Main application widget
class DoubaoWebViewApp extends StatelessWidget {
  const DoubaoWebViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doubao WebView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const WebViewScreen(),
    );
  }
}
