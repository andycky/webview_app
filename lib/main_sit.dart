import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/environment.dart';
import 'screens/webview_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load SIT environment
  await Environment.load(flavor: 'sit');
  
  runApp(const DoubaoApp());
}

class DoubaoApp extends StatelessWidget {
  const DoubaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doubao SIT',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const WebViewScreen(),
    );
  }
}
