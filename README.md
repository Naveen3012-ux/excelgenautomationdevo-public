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

This repo uses a project-local temp directory for Flutter desktop runs because
some macOS environments block Flutter from creating temp files in `/private/tmp`.

Use these commands from the project root:

- `flutter pub get`
- `bash scripts/run_macos.sh`

If you want the same temp-dir workaround for other Flutter commands, use:

- `bash scripts/flutterw.sh <flutter-command>`

Examples:

- `bash scripts/flutterw.sh run -d macos`
- `bash scripts/flutterw.sh test`
- `bash scripts/flutterw.sh analyze`

VS Code users can also run the checked-in launch config named
`Flutter macOS (repo temp dir)`.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
