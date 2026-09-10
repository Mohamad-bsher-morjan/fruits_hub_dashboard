import 'dart:io';

import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage implements StorageService {
  final storage = Supabase.instance.client.storage;

  @override
  Future<String> uploadFile(File file, String path) async {
    final fileName = b.basename(file.path);
    final folder = path.trim();
    final filePath = folder.isEmpty ? 'images/$fileName' : '$folder/$fileName';

    await storage.from('product_images').upload(filePath, file);

    final fileUrl = storage.from('product_images').getPublicUrl(filePath);

    return fileUrl;
  }
}
