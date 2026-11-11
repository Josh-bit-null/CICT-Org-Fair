# CICT Org Fair

**GitHub Pages URL (after the first successful deployment):**
https://josh-bit-null.github.io/CICT-Org-Fair/

## Run locally

1. Copy `cms.example.json` to `cms.json` and enter the hosted CMS settings.
2. Run `flutter pub get`.
3. Run `flutter run --dart-define-from-file=cms.json`.

The local `cms.json` file is ignored by Git. Never commit CMS credentials.

## Deploy the website

The `Deploy to GitHub Pages` workflow publishes on pushes to `main` and can
also be started manually from the Actions tab. In the repository's
**Settings > Pages**, choose **GitHub Actions** as the source. Add the CMS
settings as Actions variables named `CMS`, `CMS_URL`, `CMS_SPACE`,
`CMS_PROJECT`, and `CMS_DATASET`, as applicable. If the CMS requires a token,
add `CMS_TOKEN` as an Actions secret. A web build exposes any token it uses to
website visitors, so use only a read-only token intended for public clients.

## Android release

Create an upload keystore outside this project, then add its path and signing
passwords to the ignored `android/key.properties` file. Do not commit the
keystore or signing passwords. Build the APK with:

```powershell
flutter build apk --release --dart-define-from-file=cms.json
```

The APK is written to `build/app/outputs/flutter-apk/app-release.apk`.
