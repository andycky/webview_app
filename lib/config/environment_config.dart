/// Environment configuration for the WebView app
/// Supports SIT, UAT, and PROD environments
library;

import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Available environments
enum Environment { sit, uat, prod }

/// Configuration class for environment settings
class EnvironmentConfig {
  static Environment? _currentEnvironment;
  static String? _baseUrl;

  /// Load environment configuration from .env file
  static Future<void> loadEnvironment({String? flavor}) async {
    String envFile;
    
    if (flavor != null) {
      envFile = '.env.$flavor';
    } else {
      // Try to determine environment from build args or default to prod
      const String buildEnv = String.fromEnvironment('APP_ENV', defaultValue: 'prod');
      envFile = '.env.$buildEnv';
    }
    
    try {
      await dotenv.load(fileName: envFile);
      _parseEnvironment();
    } catch (e) {
      // Fallback to .env.prod if flavor-specific file not found
      try {
        await dotenv.load(fileName: '.env.prod');
        _parseEnvironment();
      } catch (fallbackError) {
        // Set defaults if no env file is available
        _currentEnvironment = Environment.prod;
        _baseUrl = 'https://www.doubao.com';
      }
    }
  }

  static void _parseEnvironment() {
    final envString = dotenv.env['APP_ENVIRONMENT'] ?? 'prod';
    _currentEnvironment = _parseEnvironmentEnum(envString);
    _baseUrl = dotenv.env['DOUBAO_URL'] ?? 'https://www.doubao.com';
  }

  static Environment _parseEnvironmentEnum(String envString) {
    switch (envString.toUpperCase()) {
      case 'SIT':
        return Environment.sit;
      case 'UAT':
        return Environment.uat;
      case 'PROD':
      default:
        return Environment.prod;
    }
  }

  /// Get the current environment
  static Environment get currentEnvironment => _currentEnvironment ?? Environment.prod;

  /// Get the base URL for the current environment
  static String get baseUrl => _baseUrl ?? 'https://www.doubao.com';

  /// Check if current environment is SIT
  static bool get isSIT => currentEnvironment == Environment.sit;

  /// Check if current environment is UAT
  static bool get isUAT => currentEnvironment == Environment.uat;

  /// Check if current environment is PROD
  static bool get isPROD => currentEnvironment == Environment.prod;

  /// Get environment name as string
  static String get environmentName {
    switch (currentEnvironment) {
      case Environment.sit:
        return 'SIT';
      case Environment.uat:
        return 'UAT';
      case Environment.prod:
        return 'PROD';
    }
  }

  /// Check if debug mode is enabled
  static bool get isDebugMode => dotenv.env['ENABLE_DEBUG_MODE'] == 'true';

  /// Check if logging is enabled
  static bool get isLoggingEnabled => dotenv.env['ENABLE_LOGGING'] == 'true';
}
