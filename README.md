# excelgenautomationdevo

A new Flutter project.

## Supabase setup

The app is wired to this Supabase project by default:

- URL: `https://yhdmhbwudxjukssjlvkd.supabase.co`
- Key: the public anon/publishable key provided for the project

The database password is not used in the Flutter client app.

## Cloudflare Pages

For frontend hosting on Cloudflare Pages, use:

- Build command: `flutter pub get && flutter build web --release`
- Build output directory: `build/web`
- Root directory: `.`

The app includes `web/_redirects` so single-page routes keep working on refresh.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
