class SupabaseConfig {
  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );

  static const String _publishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
    defaultValue: '',
  );

  static const String _anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );

  static String get publishableKey =>
      _publishableKey.isNotEmpty ? _publishableKey : _anonKey;

  static bool get isConfigured => url.isNotEmpty && publishableKey.isNotEmpty;

  static void validate() {
    if (isConfigured) return;

    throw StateError(
      'Supabase is not configured. Set SUPABASE_URL and SUPABASE_PUBLISHABLE_KEY '
      'with --dart-define at build time.',
    );
  }
}
