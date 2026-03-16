# Secrets for GitHub Actions

# GitHub Token (already available as GITHUB_TOKEN in Actions)
# GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

# Add these secrets in GitHub repo Settings > Secrets and variables > Actions:

# GitHub PAT for push access (if needed beyond GITHUB_TOKEN)
# GITHUB_PAT: ${{ secrets.GITHUB_PAT }}

# Android Keystore for signed APKs (optional, for Play Store)
# ANDROID_KEYSTORE_BASE64: ${{ secrets.ANDROID_KEYSTORE_BASE64 }}
# ANDROID_KEYSTORE_PASSWORD: ${{ secrets.ANDROID_KEYSTORE_PASSWORD }}
# ANDROID_KEY_ALIAS: ${{ secrets.ANDROID_KEY_ALIAS }}
# ANDROID_KEY_PASSWORD: ${{ secrets.ANDROID_KEY_PASSWORD }}

# Firebase App Distribution (optional)
# FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}

# Slack/Discord notifications (optional)
# SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
# DISCORD_WEBHOOK: ${{ secrets.DISCORD_WEBHOOK }}
