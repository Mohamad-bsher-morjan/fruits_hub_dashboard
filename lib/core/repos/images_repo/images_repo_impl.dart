import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';

class ImagesRepoImpl implements ImagesRepo {
  ImagesRepoImpl({
    required this.storageService,
  });

  final StorageService storageService;

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      final imageUrl = await storageService.uploadFile(image.path);

      return right(imageUrl);
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}