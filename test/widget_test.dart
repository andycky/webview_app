import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_app/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DoubaoWebViewApp());

    // Verify that the app bar is present
    expect(find.byType(AppBar), findsOneWidget);
    
    // Verify that the app title contains "Doubao"
    expect(find.textContaining('Doubao'), findsOneWidget);
  });
}
