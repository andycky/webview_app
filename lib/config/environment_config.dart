/// Environment configuration for the WebView app
/// Supports SIT, UAT, and PROD environments
library;

/// Available environments
enum Environment { sit, uat, prod }

/// Configuration class for environment settings
class EnvironmentConfig {
  /// Current active environment
  static const Environment currentEnvironment = Environment.prod;

  /// Base URLs for each environment
  static const Map<Environment, String> _baseUrlMap = {
    Environment.sit: 'https://sit.doubao.com',
    Environment.uat: 'https://uat.doubao.com',
    Environment.prod: 'https://www.doubao.com',
  };

  /// Get the base URL for the current environment
  static String get baseUrl {
    return _baseUrlMap[currentEnvironment] ?? _baseUrlMap[Environment.prod]!;
  }

  /// Get the base URL for a specific environment
  static String getBaseUrlForEnvironment(Environment env) {
    return _baseUrlMap[env] ?? _baseUrlMap[Environment.prod]!;
  }

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
}
