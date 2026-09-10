import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productRepo})
    : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    if (state is AddProductLoading) {
      return;
    }

    emit(AddProductLoading());
    final imageResult = await imagesRepo.uploadImage(
      addProductInputEntity.image,
    );

    await imageResult.fold<Future<void>>(
      (failure) async {
        if (!isClosed) {
          emit(AddProductFailure(message: failure.errMessage));
        }
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        final productResult = await productRepo.addProduct(
          addProductInputEntity,
        );
        productResult.fold(
          (failure) {
            if (!isClosed) {
              emit(AddProductFailure(message: failure.errMessage));
            }
          },
          (_) {
            if (!isClosed) {
              emit(AddProductSuccess());
            }
          },
        );
      },
    );
  }
}
