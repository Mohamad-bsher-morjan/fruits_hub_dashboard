import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_snack_bar.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/cubits/add_product/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const new({super.key});
  static const routeName = 'add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          imagesRepo: getIt.get<ImagesRepo>(),
          productRepo: getIt.get<ProductRepo>(),
        ),
        child: BlocListener<AddProductCubit, AddProductState>(
          listener: (context, state) {
            if (state case AddProductFailure(:final message)) {
              CustomSnackBar.showError(context, message: message);
            } else if (state is AddProductSuccess) {
              CustomSnackBar.showSuccess(
                context,
                message: 'Product added successfully',
              );
            }
          },
          child: AddProductViewBody(),
        ),
      ),
    );
  }
}
