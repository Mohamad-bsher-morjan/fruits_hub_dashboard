# fruit_hub_dashboard

## Supabase image uploads

Create a public Supabase Storage bucket named `product-images`, then start the
app with your project URL and anon key:

```text
flutter run --dart-define=SUPABASE_URL=https://your-project.supabase.co --dart-define=SUPABASE_PUBLISHABLE_KEY=your_publishable_key
```

To use another bucket name, also pass:

```text
--dart-define=SUPABASE_IMAGE_BUCKET=your_bucket_name
```

`uploadImage` returns the Supabase public URL. Save that URL with the product
record rather than uploading the local file to your database.
