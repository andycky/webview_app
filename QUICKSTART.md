# Quick Start Guide

Get the Doubao WebView app up and running in minutes!

## Prerequisites

- Flutter SDK 3.0.0+ ([Install Guide](https://docs.flutter.dev/get-started/install))
- Android Studio / VS Code with Flutter extensions
- Git

## Installation (5 minutes)

### 1. Clone the Repository

```bash
git clone https://github.com/andycky/webview_app.git
cd webview_app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
# Run in debug mode
flutter run

# Or run in release mode
flutter run --release
```

That's it! The app should launch on your connected device or emulator.

## Building for Production

### Android APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

### iOS App

```bash
flutter build ios --release
```

Then open `ios/Runner.xcworkspace` in Xcode to archive and distribute.

### Web

```bash
flutter build web --release
```

Output: `build/web/` - deploy to any web server.

## Environment Configuration

The app uses `.env` files for environment-specific settings:

| File | Purpose |
|------|---------|
| `.env.sit` | System Integration Testing |
| `.env.uat` | User Acceptance Testing |
| `.env.prod` | Production |

### Build for Specific Environment

```bash
# SIT
flutter build apk --dart-define=APP_ENV=sit

# UAT
flutter build apk --dart-define=APP_ENV=uat

# Production
flutter build apk --dart-define=APP_ENV=prod
```

## Common Commands

```bash
# Check Flutter installation
flutter doctor

# Run tests
flutter test

# Code analysis
flutter analyze

# Clean build artifacts
flutter clean

# Update dependencies
flutter pub get
```

## Troubleshooting

**App won't start?**
```bash
flutter clean
flutter pub get
flutter run
```

**Build fails?**
```bash
# Check Flutter setup
flutter doctor

# Check for dependency issues
flutter pub get
```

**Need help?**
- Check [README.md](README.md) for detailed documentation
- Check [DEPLOYMENT.md](DEPLOYMENT.md) for build instructions
- Open an issue on GitHub

## Next Steps

1. Customize the app icon and name
2. Configure your specific Doubao URL in `.env.*` files
3. Set up code signing for iOS/Android release builds
4. Deploy to app stores

Happy coding! 🚀
