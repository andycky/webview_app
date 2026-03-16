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
    
    // Set defaults first (before any async operations)
    _setDefaultValues();
    
    try {
      await dotenv.load(fileName: envFile, isOptional: true);
      print('Loaded environment: $envFile');
    } catch (e) {
      print('Warning: Could not load $envFile ($e)');
      // Defaults already set, continue with those
    }
  }

  static void _setDefaultValues() {
    dotenv.env['DOUBAO_URL'] = 'https://www.doubao.com/';
    dotenv.env['APP_ENVIRONMENT'] = 'PROD';
    dotenv.env['ENABLE_DEBUG_MODE'] = 'false';
    dotenv.env['ENABLE_LOGGING'] = 'false';
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
