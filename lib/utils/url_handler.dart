import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHandler {
  // Allowed domains that should open in WebView
  static const List<String> _allowedDomains = [
    'doubao.com',
    'www.doubao.com',
  ];

  static NavigationDecision handleNavigation(String url) {
    final uri = Uri.tryParse(url);
    
    if (uri == null) {
      return NavigationDecision.prevent;
    }

    // Allow http and https
    if (uri.scheme != 'http' && uri.scheme != 'https') {
      // Launch external URLs in browser (mailto:, tel:, etc.)
      _launchExternalUrl(uri);
      return NavigationDecision.prevent;
    }

    // Check if URL is in allowed domains
    if (_isAllowedDomain(uri.host)) {
      return NavigationDecision.navigate;
    }

    // Open external links in browser
    _launchExternalUrl(uri);
    return NavigationDecision.prevent;
  }

  static bool _isAllowedDomain(String host) {
    return _allowedDomains.any((domain) => 
      host == domain || host.endsWith('.$domain'));
  }

  static Future<void> _launchExternalUrl(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
