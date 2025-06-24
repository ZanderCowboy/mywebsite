# Firebase Configuration Setup

This document explains how to set up Firebase configuration for both local development and CI/CD deployment without exposing sensitive information in the repository.

## Overview

We use a template-based approach where:

- `lib/firebase_options.dart.template` contains placeholder values
- The real `lib/firebase_options.dart` is generated from the template using environment variables
- The real configuration file is gitignored to prevent accidental commits
- CI/CD uses GitHub Secrets to populate the configuration

## GitHub Secrets Setup

### Required Secrets

Add the following secrets to your GitHub repository (Settings → Secrets and variables → Actions):

| Secret Name | Description | Example Value |
|-------------|-------------|---------------|
| `FIREBASE_WEB_API_KEY` | Web API Key | `AIzaSyBLb-48wqK1Eyolk3HHa8573EQ7O_Erazc` |
| `FIREBASE_WEB_APP_ID` | Web App ID | `1:897607184986:web:7501301afce60806e0de63` |
| `FIREBASE_MESSAGING_SENDER_ID` | Messaging Sender ID | `897607184986` |
| `FIREBASE_PROJECT_ID` | Project ID | `my-website-1135d` |
| `FIREBASE_AUTH_DOMAIN` | Auth Domain | `my-website-1135d.firebaseapp.com` |
| `FIREBASE_STORAGE_BUCKET` | Storage Bucket | `my-website-1135d.firebasestorage.app` |
| `FIREBASE_MEASUREMENT_ID` | Measurement ID (Analytics) | `G-QBEKXLQJ1E` |
| `FIREBASE_ANDROID_API_KEY` | Android API Key | `AIzaSyCabZQQXI9lN31YVnoskh9cjQX2cq_KSRA` |
| `FIREBASE_ANDROID_APP_ID` | Android App ID | `1:897607184986:android:f3dddd600448c06ee0de63` |
| `FIREBASE_IOS_API_KEY` | iOS API Key | `AIzaSyAu5QfNReg1nvY2clPKFwLeRLkpNC02sG0` |
| `FIREBASE_IOS_APP_ID` | iOS App ID | `1:897607184986:ios:98f287c469cb54f9e0de63` |
| `FIREBASE_IOS_BUNDLE_ID` | iOS Bundle ID | `co.za.zanderkotze.mywebsite` |

### How to Get These Values

1. Go to your [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Go to Project Settings (gear icon)
4. Scroll down to "Your apps" section
5. For each platform (Web, Android, iOS), click the config icon and copy the values

## Local Development Setup

### Option 1: Using .env file (Recommended)

1. Create a `.env` file in the project root:

```bash
# Firebase Configuration
FIREBASE_WEB_API_KEY=AIzaSyBLb-48wqK1Eyolk3HHa8573EQ7O_Erazc
FIREBASE_WEB_APP_ID=1:897607184986:web:7501301afce60806e0de63
FIREBASE_MESSAGING_SENDER_ID=897607184986
FIREBASE_PROJECT_ID=my-website-1135d
FIREBASE_AUTH_DOMAIN=my-website-1135d.firebaseapp.com
FIREBASE_STORAGE_BUCKET=my-website-1135d.firebasestorage.app
FIREBASE_MEASUREMENT_ID=G-QBEKXLQJ1E
FIREBASE_ANDROID_API_KEY=AIzaSyCabZQQXI9lN31YVnoskh9cjQX2cq_KSRA
FIREBASE_ANDROID_APP_ID=1:897607184986:android:f3dddd600448c06ee0de63
FIREBASE_IOS_API_KEY=AIzaSyAu5QfNReg1nvY2clPKFwLeRLkpNC02sG0
FIREBASE_IOS_APP_ID=1:897607184986:ios:98f287c469cb54f9e0de63
FIREBASE_IOS_BUNDLE_ID=co.za.zanderkotze.mywebsite
```

2. Run the setup script:

```bash
chmod +x scripts/setup_firebase_config.sh
./scripts/setup_firebase_config.sh
```

### Option 2: Using environment variables

Export the environment variables in your shell:

```bash
export FIREBASE_WEB_API_KEY="AIzaSyBLb-48wqK1Eyolk3HHa8573EQ7O_Erazc"
export FIREBASE_WEB_APP_ID="1:897607184986:web:7501301afce60806e0de63"
# ... export all other variables
./scripts/setup_firebase_config.sh
```

## CI/CD Pipeline

The CI/CD pipeline automatically:

1. Copies the template file to `lib/firebase_options.dart`
2. Replaces all placeholders with values from GitHub Secrets
3. Builds the Flutter web app with the populated configuration

This happens in the "Generate firebase_options.dart from template" step in `.github/workflows/cicd.yml`.

## Security Notes

1. **Web API Keys**: Note that Firebase web API keys are considered "public" and will be visible in the compiled JavaScript. This is by design and is safe according to Firebase documentation.

2. **Mobile API Keys**: Android and iOS API keys are more sensitive and should be protected, though they'll also be embedded in the app binaries.

3. **No Secrets in Repository**: The actual Firebase configuration is never committed to the repository.

4. **Local Development**: Always use `.env` files for local development and never commit them.

## Troubleshooting

### "firebase_options.dart not found" Error

Run the setup script:

```bash
./scripts/setup_firebase_config.sh
```

### Missing Environment Variables

The script will tell you which variables are missing. Make sure all required variables are set in your `.env` file or environment.

### CI/CD Build Failures

Check that all required GitHub Secrets are set in your repository settings.

## File Structure

```sh
mywebsite/
├── lib/
│   ├── firebase_options.dart.template  # Template with placeholders (committed)
│   └── firebase_options.dart           # Generated file (gitignored)
├── scripts/
│   └── setup_firebase_config.sh        # Local setup script
├── .env                                # Local environment variables (gitignored)
└── .github/workflows/cicd.yml          # CI/CD pipeline
```
