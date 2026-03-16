# 🏗️ Build Instructions - Doubao WebView App

**Last Updated:** 2026-03-16  
**Flutter Version:** 3.24.0 (stable)

---

## 📋 Quick Reference

| Environment | Entry Point | Flavor | APK Output |
|-------------|-------------|--------|------------|
| SIT | `lib/main_sit.dart` | `sit` | `app-sit-release.apk` |
| UAT | `lib/main_uat.dart` | `uat` | `app-uat-release.apk` |
| PROD | `lib/main_prod.dart` | `prod` | `app-prod-release.apk` |

---

## 🔧 Local Build

### Prerequisites

```bash
# Check Flutter installation
flutter doctor -v

# Expected output:
# ✅ Flutter 3.24.0
# ✅ Android toolchain
# ✅ Android SDK (API 34)
# ✅ Connected device
```

### Build Commands

```bash
# Navigate to project
cd webview_app

# Get dependencies
flutter pub get

# Clean build (if needed)
flutter clean

# Build SIT APK
flutter build apk --flavor sit -t lib/main_sit.dart --release

# Build UAT APK
flutter build apk --flavor uat -t lib/main_uat.dart --release

# Build PROD APK
flutter build apk --flavor prod -t lib/main_prod.dart --release
```

### APK Location

```
build/app/outputs/flutter-apk/
├── app-sit-release.apk
├── app-uat-release.apk
└── app-prod-release.apk
```

---

## 🌐 CI/CD Build (GitHub Actions)

### Automatic Builds

- **Trigger:** Push to `main` or `develop` branches
- **Output:** GitHub Release with APK artifact
- **Retention:** 30 days

### Manual Build

1. Go to **Actions** tab in GitHub
2. Select **Flutter CI - Build APK**
3. Click **Run workflow**
4. Select flavor (sit/uat/prod)
5. Click **Run workflow**

### Download APK

1. Go to workflow run
2. Scroll to **Artifacts** section
3. Click artifact name to download
4. Or go to **Releases** for tagged builds

---

## 📱 Install on Device

### Via ADB

```bash
# Install SIT APK
adb install build/app/outputs/flutter-apk/app-sit-release.apk

# Install UAT APK
adb install build/app/outputs/flutter-apk/app-uat-release.apk

# Install PROD APK
adb install build/app/outputs/flutter-apk/app-prod-release.apk

# Install with reinstall
adb install -r build/app/outputs/flutter-apk/app-prod-release.apk
```

### Via USB

1. Enable **Developer Options** on Android device
2. Enable **USB Debugging**
3. Connect device via USB
4. Run: `flutter run --flavor prod -t lib/main_prod.dart`

---

## 🔍 Verify Build

### Check APK Info

```bash
# Using aapt2 (Android SDK)
aapt2 dump badging build/app/outputs/flutter-apk/app-prod-release.apk | grep -E "package:|sdkVersion:"

# Expected output:
# package: name='com.example.doubao_webview_app' versionCode='1' versionName='1.0'
# sdkVersion:'21'
# targetSdkVersion:'34'
```

### Check Flavor

```bash
# SIT should have .sit suffix
aapt2 dump badging build/app/outputs/flutter-apk/app-sit-release.apk | grep "package:"
# package: name='com.example.doubao_webview_app.sit'

# PROD should not have suffix
aapt2 dump badging build/app/outputs/flutter-apk/app-prod-release.apk | grep "package:"
# package: name='com.example.doubao_webview_app'
```

---

## 🐛 Troubleshooting

### Build Fails with "Gradle Error"

```bash
# Clean and rebuild
flutter clean
rm -rf android/.gradle
flutter pub get
flutter build apk --flavor prod -t lib/main_prod.dart
```

### Build Fails with "SDK Not Found"

```bash
# Set ANDROID_HOME
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Or update local.properties
echo "sdk.dir=/opt/android-sdk" > android/local.properties
```

### Build Fails with "Flutter Not Found"

```bash
# Ensure Flutter is in PATH
export PATH=$PATH:/opt/flutter/bin

# Or use full path
/opt/flutter/bin/flutter build apk --flavor prod -t lib/main_prod.dart
```

### APK Not Found After Build

```bash
# Find APK
find build -name "*.apk" -type f

# Check build output
ls -la build/app/outputs/flutter-apk/
```

### Wrong Flavor Built

```bash
# Ensure you're using the correct entry point
flutter build apk --flavor sit -t lib/main_sit.dart --release
# NOT: flutter build apk --flavor sit (missing -t flag)
```

---

## 📊 Build Configuration

### Android Build Settings

| Setting | Value |
|---------|-------|
| compileSdk | 34 |
| targetSdk | 34 |
| minSdk | 21 |
| Kotlin | 1.9.0 |
| Gradle | 8.1.0 |
| Java | 17 |

### Flutter Build Settings

| Setting | Value |
|---------|-------|
| Flutter | 3.24.0 |
| Channel | stable |
| Dart | 3.5.0 |

---

## 🔐 Signing (Future)

For production releases, configure signing:

```groovy
// android/app/build.gradle
android {
    signingConfigs {
        release {
            storeFile file("keystore.jks")
            storePassword System.getenv("KEYSTORE_PASSWORD")
            keyAlias "upload"
            keyPassword System.getenv("KEY_PASSWORD")
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

Store secrets in GitHub Secrets:
- `KEYSTORE_PASSWORD`
- `KEY_PASSWORD`
- `KEYSTORE_FILE` (base64 encoded)

---

## 📈 Build Performance

### Optimize Build Time

```bash
# Enable Gradle daemon
echo "org.gradle.daemon=true" >> android/gradle.properties

# Enable parallel builds
echo "org.gradle.parallel=true" >> android/gradle.properties

# Enable build cache
echo "org.gradle.caching=true" >> android/gradle.properties
```

### CI/CD Optimization

- Flutter caching enabled (pubspec.lock hash)
- Gradle caching enabled
- Build time: ~5-8 minutes

---

## 📞 Support

**Issues:**
- Check `TECH_LEAD_REVIEW.md` for known issues
- Review CI logs in GitHub Actions
- Run `flutter doctor -v` for diagnostics

**Contact:**
- Tech Lead: For architectural questions
- Dev Team: For implementation questions

---

*Build successfully tested on 2026-03-16*
