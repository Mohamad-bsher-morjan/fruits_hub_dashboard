import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_snack_bar.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/cubits/add_product/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_chek_box.dart';

class AddProductViewBody extends StatefulWidget {
  const new({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price;
  File? image;
  bool isFeatured = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (p0) {
                  name = p0!;
                },
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (p0) {
                  price = num.parse(p0!.trim());
                },
                hintText: 'Product Price',
                textInputType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) {
                  final parsedPrice = num.tryParse(value?.trim() ?? '');
                  if (parsedPrice == null || parsedPrice < 0) {
                    return 'Enter a valid price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (p0) {
                  code = p0!.toLowerCase();
                },
                hintText: 'Product Code',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (p0) {
                  description = p0!;
                },
                hintText: 'Product Description',
                maxLines: 5,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),

              SizedBox(height: 2),
              ImageField(
                onFileChanged: (selectedImage) {
                  setState(() {
                    image = selectedImage;
                  });
                },
              ),
              SizedBox(height: 16),

              BlocBuilder<AddProductCubit, AddProductState>(
                builder: (context, state) {
                  final isLoading = state is AddProductLoading;
                  return CustomButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (image != null) {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                AddProductInputEntity input =
                                    AddProductInputEntity(
                                      name: name,
                                      code: code,
                                      description: description,
                                      price: price,
                                      image: image!,
                                      isFeatured: isFeatured,
                                    );

                                context.read<AddProductCubit>().addProduct(
                                  input,
                                );
                              } else {
                                autovalidateMode = AutovalidateMode.always;

                                setState(() {});
                              }
                            } else {
                              CustomSnackBar.showError(
                                context,
                                message: 'Please Select an image',
                              );
                            }
                          },
                    text: isLoading ? 'Adding Product...' : 'Add Product',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
