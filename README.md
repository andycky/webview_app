# Doubao WebView App - README

## 📱 Project Overview

A Flutter WebView wrapper app that provides a native app experience for accessing Doubao.com.

**Features:**
- WebView-based browser for Doubao.com
- Environment-based URL configuration (SIT/UAT/PROD)
- Cross-platform (iOS & Android)
- Native app feel with proper navigation

---

## 🚀 Quick Start

### Prerequisites

- Flutter SDK 3.x or later
- Android Studio / VS Code with Flutter extensions
- Android SDK (for Android builds)
- Xcode (for iOS builds, macOS only)

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd doubao_webview_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure environment**

Create `.env` file in project root:
```env
DOUBAO_URL=https://www.doubao.com/
```

Or use build flavors for different environments:
- `.env.sit`
- `.env.uat`
- `.env.prod`

4. **Run the app**
```bash
# Run with default environment
flutter run

# Run with specific flavor
flutter run --flavor sit -t lib/main_sit.dart
flutter run --flavor uat -t lib/main_uat.dart
flutter run --flavor prod -t lib/main_prod.dart
```

---

## 📁 Project Structure

```
doubao_webview_app/
├── lib/
│   ├── main.dart              # App entry point
│   ├── config/
│   │   ├── app_config.dart    # App configuration
│   │   └── environment.dart   # Environment variables
│   ├── screens/
│   │   └── webview_screen.dart # Main WebView screen
│   ├── widgets/
│   │   ├── loading_indicator.dart
│   │   └── error_widget.dart
│   └── utils/
│       └── url_handler.dart   # URL handling logic
├── android/                    # Android-specific files
├── ios/                        # iOS-specific files
├── .env.sit                    # SIT environment config
├── .env.uat                    # UAT environment config
├── .env.prod                   # PROD environment config
├── pubspec.yaml               # Dependencies
└── README.md                  # This file
```

---

## 🏗️ Build Flavors

| Flavor | Environment | URL | Use Case |
|--------|-------------|-----|----------|
| `sit` | SIT | Configured in .env.sit | Development & Integration Testing |
| `uat` | UAT | Configured in .env.uat | User Acceptance Testing |
| `prod` | PROD | Configured in .env.prod | Production Release |

### Building for Release

```bash
# Android APK
flutter build apk --flavor prod -t lib/main_prod.dart

# Android App Bundle
flutter build appbundle --flavor prod -t lib/main_prod.dart

# iOS
flutter build ios --flavor prod -t lib/main_prod.dart
```

---

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

---

## 📝 Key Features

### WebView Configuration
- Full-screen WebView experience
- JavaScript enabled
- Cookie support
- Cache management

### Navigation
- Back/Forward navigation
- Pull-to-refresh
- Loading indicators
- Error handling

### Security
- HTTPS only
- External link handling
- Permission management

---

## 🔧 Configuration

### Android Permissions

`android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
```

### iOS Configuration

`ios/Runner/Info.plist`:
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <false/>
</dict>
```

---

## 🐛 Troubleshooting

### Common Issues

**WebView not loading:**
- Check internet permission in AndroidManifest.xml
- Verify URL is accessible
- Check ATS configuration on iOS

**Build fails:**
- Run `flutter clean`
- Run `flutter pub get`
- Check Flutter doctor: `flutter doctor -v`

---

## 📞 Support

For issues or questions, refer to the scrum team documentation or contact the development team.

---

## 📄 License

[Add license information]

---

*Last Updated: 2026-03-16*
*Version: 0.1.0 (Sprint 0)*
