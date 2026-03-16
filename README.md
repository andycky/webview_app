# Doubao WebView App

A Flutter WebView application that wraps Doubao.com with support for multiple environments (SIT, UAT, PROD).

## Features

- 🌐 WebView integration using `webview_flutter` package
- 🔄 Multi-environment support (SIT, UAT, PROD)
- 📱 Cross-platform (iOS, Android, Web)
- ⚡ Loading indicators with progress
- ❌ Error handling with retry functionality
- 🎨 Material Design 3 UI
- 🌙 Dark mode support
- 🔒 Secure network configuration

## Environment Configuration

The app supports three environments configured via `.env` files:

| Environment | File | Base URL |
|-------------|------|----------|
| SIT | `.env.sit` | https://www.doubao.com/ |
| UAT | `.env.uat` | https://www.doubao.com/ |
| PROD | `.env.prod` | https://www.doubao.com/ |

### Changing Environment

To switch environments, use the `--dart-define` flag when building:

```bash
# Build for SIT
flutter build apk --dart-define=APP_ENV=sit

# Build for UAT
flutter build apk --dart-define=APP_ENV=uat

# Build for Production
flutter build apk --dart-define=APP_ENV=prod
```

Or modify the `DOUBAO_URL` in the respective `.env.*` file.

## Project Structure

```
lib/
├── config/
│   ├── config.dart              # Configuration exports
│   └── environment_config.dart  # Environment settings
├── screens/
│   ├── screens.dart             # Screen exports
│   └── webview_screen.dart      # Main WebView screen
├── widgets/
│   ├── widgets.dart             # Widget exports
│   ├── loading_indicator.dart   # Loading UI
│   └── error_widget.dart        # Error handling UI
└── main.dart                    # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK 3.0.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / Xcode (for mobile development)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/andycky/webview_app.git
cd webview_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Building for Production

#### Android
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```

#### Web
```bash
flutter build web --release
```

## Configuration

### Android Permissions

The app requires internet access, which is configured in `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
```

### iOS App Transport Security

iOS configuration allows HTTPS connections in `ios/Runner/Info.plist`:

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoadsInWebContent</key>
    <true/>
</dict>
```

## Error Handling

The app includes comprehensive error handling:

- Network errors display a user-friendly error message
- Retry functionality allows users to reload failed pages
- Loading indicators show page load progress

## Dependencies

- `webview_flutter`: ^4.4.2 - WebView implementation
- `webview_flutter_android`: ^3.12.0 - Android WebView support
- `webview_flutter_wkwebview`: ^3.9.5 - iOS WebView support
- `flutter_dotenv`: ^5.1.0 - Environment configuration
- `flutter_lints`: ^3.0.1 - Linting rules

## Development

### Code Style

This project follows Flutter's recommended coding standards. Run linting:

```bash
flutter analyze
```

### Testing

Run tests:

```bash
flutter test
```

## License

This project is proprietary and confidential.

## Support

For issues and questions, please open an issue on the GitHub repository.
