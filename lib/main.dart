import 'package:flutter/material.dart';
import 'config.dart';
import 'webview_page.dart';
import 'settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load saved configuration
  await AppConfig.loadConfig();
  
  runApp(const RestrictedWebViewApp());
}

class RestrictedWebViewApp extends StatelessWidget {
  const RestrictedWebViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restricted WebView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _webViewKey = GlobalKey();
  int _settingsChangeCounter = 0;

  void _onSettingsChanged() {
    // Force rebuild of WebView with new config
    setState(() {
      _settingsChangeCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyedSubtree(
        key: ValueKey('webview-$_settingsChangeCounter'),
        child: const RestrictedWebViewPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
          
          // If settings were changed, reload the WebView
          if (result == true && mounted) {
            _onSettingsChanged();
          }
        },
        tooltip: 'Settings',
        child: const Icon(Icons.settings),
      ),
    );
  }
}
