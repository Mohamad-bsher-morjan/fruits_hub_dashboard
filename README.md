# fruit_hub_dashboard

## Cloudinary image uploads

Create an **unsigned** upload preset in Cloudinary, then start the app with your
Cloudinary cloud name and preset name:

```text
flutter run --dart-define=CLOUDINARY_CLOUD_NAME=your_cloud_name --dart-define=CLOUDINARY_UPLOAD_PRESET=your_unsigned_preset
```

Use the values when constructing the image repository:

```dart
final imagesRepo = ImagesRepoImpl(
	cloudName: CloudinaryConfig.cloudName,
	uploadPreset: CloudinaryConfig.uploadPreset,
);
```

`uploadImage` returns the Cloudinary `secure_url`. Save that URL with the
product record rather than uploading the local file to your database.
