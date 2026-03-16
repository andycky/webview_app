import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get doubaoUrl => dotenv.env['DOUBAO_URL'] ?? 'https://www.doubao.com/';
  static String get appEnvironment => dotenv.env['APP_ENVIRONMENT'] ?? 'development';
  static bool get enableDebugMode => dotenv.env['ENABLE_DEBUG_MODE'] == 'true';
  static bool get enableLogging => dotenv.env['ENABLE_LOGGING'] == 'true';

  static Future<void> load() async {
    // Determine which env file to load based on flavor
    // This is set at build time via build flavors
    const String envFile = String.fromEnvironment('ENV_FILE', defaultValue: '.env');
    
    try {
      await dotenv.load(fileName: envFile);
      print('Loaded environment: $envFile');
    } catch (e) {
      // Fallback to default .env if flavor-specific file not found
      await dotenv.load(fileName: '.env');
      print('Loaded default environment: .env');
    }
  }

  static bool isProduction() {
    return appEnvironment.toUpperCase() == 'PROD';
  }

  static bool isDevelopment() {
    return !isProduction();
  }
}
