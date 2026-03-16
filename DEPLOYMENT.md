# Deployment Guide

This guide covers building and deploying the Doubao WebView app for different environments and platforms.

## Environment Setup

### Prerequisites

1. **Flutter SDK** (3.0.0 or higher)
   ```bash
   flutter --version
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

## Environment Configuration

The app supports three environments configured via `.env` files:

| File | Environment | URL |
|------|-------------|-----|
| `.env.sit` | SIT (System Integration Testing) | https://www.doubao.com/ |
| `.env.uat` | UAT (User Acceptance Testing) | https://www.doubao.com/ |
| `.env.prod` | Production | https://www.doubao.com/ |

### Building for Different Environments

#### SIT Build
```bash
flutter build apk --dart-define=APP_ENV=sit
# or for iOS
flutter build ios --dart-define=APP_ENV=sit
```

#### UAT Build
```bash
flutter build apk --dart-define=APP_ENV=uat
# or for iOS
flutter build ios --dart-define=APP_ENV=uat
```

#### Production Build
```bash
flutter build apk --release --dart-define=APP_ENV=prod
# or for iOS
flutter build ios --release --dart-define=APP_ENV=prod
```

## Platform-Specific Builds

### Android

#### Debug APK
```bash
flutter build apk --debug
```

#### Release APK
```bash
flutter build apk --release
```

#### App Bundle (for Google Play)
```bash
flutter build appbundle --release
```

**Output location:** `build/app/outputs/flutter-apk/` or `build/app/outputs/bundle/`

### iOS

#### Debug Build
```bash
flutter build ios --debug
```

#### Release Build
```bash
flutter build ios --release
```

**Output location:** `build/ios/iphoneos/`

**Note:** For iOS, you'll need to:
1. Open `ios/Runner.xcworkspace` in Xcode
2. Configure signing with your Apple Developer account
3. Archive and distribute through Xcode or App Store Connect

### Web

#### Build for Web
```bash
flutter build web --release
```

**Output location:** `build/web/`

**Deploy to hosting:**
- Copy contents of `build/web/` to your web server
- Or deploy to Firebase Hosting, Netlify, Vercel, etc.

## GitHub Upload

### Initial Setup

```bash
cd webview_app
git init
git remote add origin https://github.com/andycky/webview_app.git
git add .
git commit -m "Initial commit: Flutter WebView app for Doubao.com"
git push -u origin main
```

### Ongoing Development

```bash
git add .
git commit -m "feat: description of changes"
git push origin main
```

## CI/CD Pipeline

The project includes a GitHub Actions workflow (`.github/workflows/ci.yml`) that:

1. Runs on push to `main` and `develop` branches
2. Installs Flutter dependencies
3. Runs code analysis
4. Executes tests
5. Builds release APK
6. Uploads APK as artifact

## Version Management

Update version in `pubspec.yaml`:

```yaml
version: 1.0.0+1  # version+build_number
```

### Version Naming Convention

- **MAJOR.MINOR.PATCH+BUILD**
- Increment MAJOR for breaking changes
- Increment MINOR for new features
- Increment PATCH for bug fixes
- Increment BUILD for each build

## Testing Before Release

### Run Tests
```bash
flutter test
```

### Code Analysis
```bash
flutter analyze
```

### Run on Device
```bash
flutter run
```

### Run in Release Mode
```bash
flutter run --release
```

## Troubleshooting

### Common Issues

#### Build fails with dependency errors
```bash
flutter clean
flutter pub get
flutter build apk
```

#### iOS build issues
```bash
cd ios
pod install
cd ..
flutter build ios
```

#### Android signing issues
Configure signing in `android/app/build.gradle`:
```gradle
android {
    ...
    signingConfigs {
        release {
            keyAlias 'your-key-alias'
            keyPassword 'your-key-password'
            storeFile file('your-keystore.jks')
            storePassword 'your-store-password'
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

## Security Considerations

1. **Never commit `.env` files with secrets** - Use `.env.template` as a reference
2. **Use secure URLs** - All environments use HTTPS
3. **Enable ProGuard** - Release builds use code shrinking and obfuscation
4. **iOS ATS** - App Transport Security is configured for HTTPS only

## Support

For issues, please open a GitHub issue at: https://github.com/andycky/webview_app/issues
