# fruit_hub_dashboard

## Supabase image uploads

Create a public Supabase Storage bucket named `product_images`, then run the
policy in `supabase/storage_policies.sql` from the Supabase SQL Editor. The
dashboard currently uploads without a Supabase Auth session, so the policy is
required for anonymous inserts and for Storage to return the new object's
metadata. Re-running the script safely replaces those two policies. Then start
the app with your project URL and publishable key:

```text
flutter run --dart-define=SUPABASE_URL=https://your-project.supabase.co --dart-define=SUPABASE_PUBLISHABLE_KEY=your_publishable_key
```

To use another bucket name, also pass:

```text
--dart-define=SUPABASE_IMAGE_BUCKET=your_bucket_name
```

`uploadImage` returns the Supabase public URL. Save that URL with the product
record rather than uploading the local file to your database.
