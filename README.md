# Restricted WebView Flutter App

A Flutter mobile app that embeds a WebView restricted to connect **only** to a configurable IP address (default: `10.0.0.1`).

## Features

- 🔒 **IP Restriction**: All navigation is blocked except to the configured IP address
- ⚙️ **Configurable**: Change the IP address and port through the settings UI
- 💾 **Persistent Settings**: Configuration is saved and restored between app launches
- 🛡️ **Navigation Blocking**: Prevents redirects, links, and JavaScript navigation to unauthorized URLs
- 📱 **Material Design**: Clean, modern UI following Material 3 guidelines

## Requirements

- Flutter SDK >= 3.0.0
- Android API level 17+ / iOS 12+

## Installation

1. **Clone or copy** this project to your workspace

2. **Install dependencies**:
   ```bash
   cd flutter-webview-app
   flutter pub get
   ```

3. **Configure platform settings**:

   ### Android
   Add internet permission to `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <uses-permission android:name="android.permission.INTERNET"/>
   ```

   ### iOS
   No additional configuration needed for HTTP (the app uses http:// by default).
   If you need HTTPS, update the URL scheme in `config.dart`.

4. **Run the app**:
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # Build APK
   flutter build apk

   # Build iOS
   flutter build ios
   ```

## Usage

1. **Launch the app** - It will load `http://10.0.0.1:80` by default

2. **Change the IP address**:
   - Tap the settings button (⚙️) in the bottom-right
   - Enter a new IP address (e.g., `192.168.1.100`)
   - Optionally change the port (default: 80)
   - Tap "Save Settings"
   - The WebView will reload with the new configuration

3. **Refresh**: Tap the refresh icon in the app bar to reload the page

## Security Notes

- The app blocks **all** navigation to URLs outside the configured IP
- This includes: link clicks, form submissions, redirects, and JavaScript-initiated navigation
- For development, `localhost` and `127.0.0.1` are also allowed when the configured IP is `10.0.0.1`
- The app uses HTTP by default. For production, consider updating to HTTPS

## Project Structure

```
flutter-webview-app/
├── lib/
│   ├── main.dart           # App entry point
│   ├── config.dart         # Configuration manager
│   ├── webview_page.dart   # Restricted WebView implementation
│   └── settings_page.dart  # Settings UI
├── pubspec.yaml            # Dependencies
└── README.md               # This file
```

## Customization

### Change Default IP
Edit `lib/config.dart`:
```dart
static const String _defaultIp = 'YOUR_DEFAULT_IP';
```

### Enable HTTPS
In `lib/config.dart`, change the URL scheme:
```dart
static String get fullUrl => 'https://$_ipAddress:$_port';
```

### Add Allowed Domains
Modify `AppConfig.isUrlAllowed()` in `lib/config.dart` to whitelist additional domains if needed.

## Troubleshooting

**WebView not loading?**
- Check that the target server is running and accessible
- Verify the IP address and port are correct
- Check network connectivity

**Settings not saving?**
- Ensure the app has storage permissions (should be automatic)
- Try restarting the app after saving

**Build errors?**
- Run `flutter clean` then `flutter pub get`
- Ensure Flutter SDK is up to date

## License

MIT License - Feel free to modify and distribute.
