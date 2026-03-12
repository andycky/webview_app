import 'package:shared_preferences/shared_preferences.dart';

/// Configuration manager for the restricted WebView app.
/// 
/// The default IP address is 10.0.0.1 but can be changed by the user.
class AppConfig {
  static const String _defaultIp = '10.0.0.1';
  static const String _ipKey = 'restricted_ip';
  static const int _defaultPort = 80;

  static String _ipAddress = _defaultIp;
  static int _port = _defaultPort;

  /// Get the current configured IP address
  static String get ipAddress => _ipAddress;

  /// Get the current configured port
  static int get port => _port;

  /// Get the full URL (http://ip:port)
  static String get fullUrl => 'http://$_ipAddress:$_port';

  /// Load configuration from persistent storage
  static Future<void> loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    _ipAddress = prefs.getString(_ipKey) ?? _defaultIp;
    _port = prefs.getInt('restricted_port') ?? _defaultPort;
  }

  /// Save a new IP address to persistent storage
  static Future<void> saveIpAddress(String ip) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_ipKey, ip);
    _ipAddress = ip;
  }

  /// Save a new port to persistent storage
  static Future<void> savePort(int port) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('restricted_port', port);
    _port = port;
  }

  /// Validate if an IP address format is correct
  static bool isValidIpAddress(String ip) {
    // Simple IPv4 validation
    final ipRegex = RegExp(
      r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}'
      r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
    );
    return ipRegex.hasMatch(ip);
  }

  /// Check if a URL is allowed (matches the configured IP)
  static bool isUrlAllowed(String url) {
    try {
      final uri = Uri.parse(url);
      if (uri.host == _ipAddress) {
        return true;
      }
      // Also allow localhost/127.0.0.1 for development
      if (_ipAddress == '10.0.0.1' && 
          (uri.host == 'localhost' || uri.host == '127.0.0.1')) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
