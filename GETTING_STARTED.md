# 🚀 Getting Started - Quick Start Guide

## Prerequisites Check

Before running the app, ensure you have Flutter installed:

### 1. Install Flutter SDK

**Option A: Using Flutter Version Manager (Recommended)**
```bash
# Install fvm
dart pub global activate fvm

# Install Flutter 3.x
fvm install 3.16.0

# Set version for project
fvm use 3.16.0
```

**Option B: Direct Installation**

**macOS:**
```bash
brew install --cask flutter
```

**Windows:**
```powershell
# Download from https://docs.flutter.dev/get-started/install
# Or use winget
winget install Google.Flutter
```

**Linux:**
```bash
# Download Flutter SDK from https://docs.flutter.dev/get-started/install
# Or use snap
sudo snap install flutter --classic
```

### 2. Verify Installation
```bash
flutter doctor -v
```

You should see:
- ✅ Flutter SDK
- ✅ Android toolchain (for Android builds)
- ✅ Xcode (for iOS builds, macOS only)
- ✅ Chrome (optional, for web testing)
- ✅ A connected device or emulator

### 3. Install Dependencies
```bash
cd doubao-webview-app
flutter pub get
```

### 4. Run the App

**With Android Emulator:**
```bash
# Start emulator first, then:
flutter run --flavor sit -t lib/main.dart
```

**With iOS Simulator (macOS only):**
```bash
flutter run --flavor sit -t lib/main.dart
```

**With Connected Device:**
```bash
flutter devices  # List available devices
flutter run --flavor sit -t lib/main.dart -d <device-id>
```

---

## 🛠️ IDE Setup

### VS Code
1. Install **Flutter** extension
2. Install **Dart** extension
3. Open `doubao-webview-app` folder
4. Press `F5` to run (select device when prompted)

### Android Studio
1. Install **Flutter** plugin
2. Install **Dart** plugin
3. Open `doubao-webview-app` folder
4. Click **Run** button (select device when prompted)

---

## 🔧 Build Flavors

| Flavor | Command | Environment |
|--------|---------|-------------|
| SIT | `flutter run --flavor sit -t lib/main.dart` | Development/Testing |
| UAT | `flutter run --flavor uat -t lib/main.dart` | User Acceptance |
| PROD | `flutter run --flavor prod -t lib/main.dart` | Production |

---

## 📱 Build for Release

### Android APK
```bash
flutter build apk --flavor prod -t lib/main.dart --release
# Output: build/app/outputs/flutter-apk/app-prod-release.apk
```

### Android App Bundle (Play Store)
```bash
flutter build appbundle --flavor prod -t lib/main.dart --release
# Output: build/app/outputs/bundle/prodRelease/app-prod-release.aab
```

### iOS (macOS only)
```bash
flutter build ios --flavor prod -t lib/main.dart --release
# Opens Xcode for archive & App Store submission
```

---

## 🐛 Troubleshooting

### "flutter: command not found"
→ Install Flutter SDK (see above)

### "No devices found"
- **Android:** Start an emulator in Android Studio
- **iOS:** Open Simulator (macOS only)
- **Physical:** Connect device via USB, enable USB debugging

### "Pub get failed"
```bash
flutter clean
flutter pub get
```

### "Build failed"
```bash
flutter clean
flutter pub get
flutter run
```

### WebView not loading
1. Check internet permission in `AndroidManifest.xml`
2. Verify URL is accessible
3. Check `NSAppTransportSecurity` in `Info.plist`

---

## 📞 Need Help?

- **Flutter Docs:** https://docs.flutter.dev
- **WebView Package:** https://pub.dev/packages/webview_flutter
- **Team:** Check `scrum-team.md` for role assignments

---

*Last Updated: 2026-03-16*
