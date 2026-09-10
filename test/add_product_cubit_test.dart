import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/cubits/add_product/add_product_cubit.dart';

class _SuccessfulImagesRepo implements ImagesRepo {
  int uploadCalls = 0;

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    uploadCalls++;
    return const Right('https://example.com/product.jpg');
  }
}

class _DelayedProductRepo implements ProductRepo {
  final completion = Completer<void>();

  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    await completion.future;
    return const Right(null);
  }
}

void main() {
  test('waits for the product write before reporting success', () async {
    final imagesRepo = _SuccessfulImagesRepo();
    final productRepo = _DelayedProductRepo();
    final cubit = AddProductCubit(
      imagesRepo: imagesRepo,
      productRepo: productRepo,
    );
    final product = AddProductInputEntity(
      name: 'Apple',
      code: 'apple',
      description: 'Fresh apple',
      price: 2,
      image: File('apple.jpg'),
      isFeatured: true,
    );

    final submission = cubit.addProduct(product);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state, isA<AddProductLoading>());
    await cubit.addProduct(product);
    expect(imagesRepo.uploadCalls, 1);
    productRepo.completion.complete();
    await submission;

    expect(product.imageUrl, 'https://example.com/product.jpg');
    expect(cubit.state, isA<AddProductSuccess>());
    await cubit.close();
  });
}
