import 'dart:io';

import 'package:fruit_hub_dashboard/constants.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static Future<void> createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();

    bool isBucketExists = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExists = true;
        break;
      }
    }

    if (!isBucketExists) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static Future<void> initSupabaseStorage() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      publishableKey: kSupabaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basenameWithoutExtension(file.path);
    String extensionName = b.extension(file.path);

    String finalFileName;

    if (extensionName.isEmpty) {
      finalFileName = fileName;
    } else {
      finalFileName = '$fileName$extensionName';
    }

    await _supabase.client.storage
        .from(kImageBucket)
        .upload('$path/$finalFileName', file);

    final String publicUrl = _supabase.client.storage
        .from(kImageBucket)
        .getPublicUrl('$path/$finalFileName');

    return publicUrl;
  }
}
