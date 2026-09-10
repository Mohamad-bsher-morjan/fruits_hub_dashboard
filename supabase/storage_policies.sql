-- The dashboard currently uploads without a Supabase Auth session.
-- Keep anonymous access limited to the product_images bucket and images/ folder.
-- Storage completes uploads with INSERT ... RETURNING, so the SELECT policy is
-- required alongside INSERT for the newly created object metadata to be returned.
drop policy if exists "Allow anonymous product image uploads" on storage.objects;
drop policy if exists "Allow anonymous product image metadata read" on storage.objects;

create policy "Allow anonymous product image uploads"
on storage.objects
for insert
to anon
with check (
  bucket_id = 'product_images'
  and (storage.foldername(name))[1] = 'images'
);

create policy "Allow anonymous product image metadata read"
on storage.objects
for select
to anon
using (
  bucket_id = 'product_images'
  and (storage.foldername(name))[1] = 'images'
);
