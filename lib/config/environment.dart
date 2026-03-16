/// Environment configuration for SIT/UAT/PROD builds
/// URLs are hardcoded per flavor - no .env files needed
class Environment {
  // These are set at compile time via build flavors
  static const String _baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'https://www.google.com/');
  static const String _envName = String.fromEnvironment('ENVIRONMENT', defaultValue: 'PROD');
  static const bool _debugMode = bool.fromEnvironment('ENABLE_DEBUG_MODE', defaultValue: false);
  static const bool _logging = bool.fromEnvironment('ENABLE_LOGGING', defaultValue: false);

  static String get doubaoUrl => _baseUrl;
  static String get appEnvironment => _envName;
  static bool get enableDebugMode => _debugMode;
  static bool get enableLogging => _logging;

  static Future<void> load({String? flavor}) async {
    print('Environment: $_envName');
    print('Base URL: $_baseUrl');
    // No async loading needed - values are compile-time constants
  }

  static bool isProduction() {
    return _envName.toUpperCase() == 'PROD';
  }

  static bool isDevelopment() {
    return !isProduction();
  }
  
  static String get environmentDisplayName {
    if (isProduction()) return 'Production';
    if (_envName.toUpperCase() == 'SIT') return 'SIT';
    if (_envName.toUpperCase() == 'UAT') return 'UAT';
    return 'Development';
  }
}
