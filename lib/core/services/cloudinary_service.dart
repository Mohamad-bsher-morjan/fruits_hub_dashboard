import 'dart:convert';

import 'package:fruit_hub_dashboard/core/repos/images_repo/cloudinary_config.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:http/http.dart' as http;

class CloudinaryService implements StorageService {
  @override
  Future<String> uploadFile(String file) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(
        'https://api.cloudinary.com/v1_1/'
        '${CloudinaryConfig.cloudName}/image/upload',
      ),
    );

    request.fields['upload_preset'] = CloudinaryConfig.uploadPreset;

    request.files.add(await http.MultipartFile.fromPath('file', file));

    final response = await request.send();

    final responseBody = await response.stream.bytesToString();

    final data = jsonDecode(responseBody) as Map<String, dynamic>;

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final secureUrl = data['secure_url'] as String?;

      if (secureUrl != null && secureUrl.isNotEmpty) {
        return secureUrl;
      }
    }

    throw Exception(
      data['error']?['message']?.toString() ?? 'Image upload failed',
    );
  }
}
