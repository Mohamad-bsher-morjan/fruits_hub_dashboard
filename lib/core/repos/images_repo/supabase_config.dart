class SupabaseConfig {
  static const url = String.fromEnvironment('SUPABASE_URL');
  static const publishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
  );
  static const imageBucket = String.fromEnvironment(
    'SUPABASE_IMAGE_BUCKET',
    defaultValue: 'product-images',
  );
}