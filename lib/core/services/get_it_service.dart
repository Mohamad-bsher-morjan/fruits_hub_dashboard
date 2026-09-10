import 'package:get_it/get_it.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/supa_storage.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<StorageService>(() => SupabaseStorage());
  getIt.registerLazySingleton<ImagesRepo>(
    () => ImagesRepoImpl(storageService: getIt<StorageService>()),
  );
}
