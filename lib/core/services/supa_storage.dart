import 'dart:io';

import 'package:fruit_hub_dashboard/core/repos/images_repo/supabase_config.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage implements StorageService {
  final storage = Supabase.instance.client.storage;

  @override
  Future<String> uploadFile(File file, String path) async {
    final fileName = b.basename(file.path);
    final folder = path.trim();
    final uniqueFileName = '${DateTime.now().microsecondsSinceEpoch}_$fileName';
    final filePath = folder.isEmpty
        ? 'images/$uniqueFileName'
        : '$folder/$uniqueFileName';

    await storage
        .from(SupabaseConfig.imageBucket)
        .upload(filePath, file, fileOptions: const FileOptions(upsert: false));

    final fileUrl = storage
        .from(SupabaseConfig.imageBucket)
        .getPublicUrl(filePath);

    return fileUrl;
  }
}
