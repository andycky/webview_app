import 'package:shared_preferences/shared_preferences.dart';

/// Configuration manager for the restricted WebView app.
/// 
/// The default domain is www.doubao.com but can be changed by the user.
class AppConfig {
  static const String _defaultDomain = 'www.doubao.com';
  static const String _domainKey = 'restricted_domain';

  static String _domain = _defaultDomain;

  /// Get the current configured domain
  static String get domain => _domain;

  /// Get the full URL (https://domain)
  static String get fullUrl => 'https://$_domain';

  /// Load configuration from persistent storage
  static Future<void> loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    _domain = prefs.getString(_domainKey) ?? _defaultDomain;
  }

  /// Save a new domain to persistent storage
  static Future<void> saveDomain(String domain) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_domainKey, domain);
    _domain = domain;
  }

  /// Validate if a domain format is correct
  static bool isValidDomain(String domain) {
    // Simple domain validation
    final domainRegex = RegExp(
      r'^[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)*$'
    );
    return domainRegex.hasMatch(domain);
  }

  /// Check if a URL is allowed (matches the configured domain)
  static bool isUrlAllowed(String url) {
    try {
      final uri = Uri.parse(url);
      if (uri.host == _domain || uri.host.endsWith('.' + _domain)) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
