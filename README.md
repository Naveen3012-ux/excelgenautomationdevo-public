# excelgenautomationdevo

A new Flutter project.

## Supabase setup

This app expects Supabase values at build time:

```bash
flutter build web --release \
  --dart-define=SUPABASE_URL=your-url \
  --dart-define=SUPABASE_PUBLISHABLE_KEY=your-key
```

For Render, set the same values in the service build environment and use the same
`--dart-define` flags in the build command.

If those variables are omitted, the app still loads, but Supabase is not initialized.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
