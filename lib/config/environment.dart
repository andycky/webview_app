import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get doubaoUrl => dotenv.env['DOUBAO_URL'] ?? 'https://www.doubao.com/';
  static String get appEnvironment => dotenv.env['APP_ENVIRONMENT'] ?? 'development';
  static bool get enableDebugMode => dotenv.env['ENABLE_DEBUG_MODE'] == 'true';
  static bool get enableLogging => dotenv.env['ENABLE_LOGGING'] == 'true';

  static Future<void> load({String? flavor}) async {
    String envFile;
    
    if (flavor != null) {
      envFile = '.env.$flavor';
    } else {
      // Determine which env file to load based on flavor from build args
      const String buildFlavor = String.fromEnvironment('ENV_FILE', defaultValue: '');
      envFile = buildFlavor.isNotEmpty ? buildFlavor : '.env';
    }
    
    try {
      await dotenv.load(fileName: envFile);
      print('Loaded environment: $envFile');
    } catch (e) {
      // Fallback to default .env if flavor-specific file not found
      print('Warning: Could not load $envFile, falling back to .env');
      try {
        await dotenv.load(fileName: '.env');
        print('Loaded default environment: .env');
      } catch (fallbackError) {
        print('Error loading environment: $fallbackError');
        // Set defaults if no env file is available
        dotenv.env['DOUBAO_URL'] = 'https://www.doubao.com/';
        dotenv.env['APP_ENVIRONMENT'] = 'development';
      }
    }
  }

  static bool isProduction() {
    return appEnvironment.toUpperCase() == 'PROD';
  }

  static bool isDevelopment() {
    return !isProduction();
  }
  
  static String get environmentDisplayName {
    if (isProduction()) return 'Production';
    if (appEnvironment.toUpperCase() == 'SIT') return 'SIT';
    if (appEnvironment.toUpperCase() == 'UAT') return 'UAT';
    return 'Development';
  }
}
