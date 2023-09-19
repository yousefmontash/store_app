import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:strore_app/models/product_model.dart';
import 'package:strore_app/pages/cubits/product_page_cubit/product_page_cubit.dart';
import 'package:strore_app/pages/cubits/products_cubit/products_cubit.dart';
import 'package:strore_app/services/put_product_service.dart';
import 'package:strore_app/widgets/custom_button.dart';
import 'package:strore_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  static String id = "update product page";
  String? name, desc, image;
  bool isLoading = false;
  String? price;

  UpdateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlocConsumer<ProductPageCubit, ProductPageState>(
      listener: (context, state) {
        if (state is ProductPageLoading) {
          isLoading = true;
        } else if (state is ProductPageSucceed) {
          isLoading = false;
          BlocProvider.of<ProductsCubit>(context).getAllProducts();
          Navigator.pop(context);
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Update Product",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        name = data;
                      },
                      hintText: "Product Name : ",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        desc = data;
                      },
                      hintText: "Description : ",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      inputType: TextInputType.number,
                      onChanged: (data) {
                        price = data;
                      },
                      hintText: "price : ",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        image = data;
                      },
                      hintText: "image : ",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      text: "Update",
                      onTap: () {
                        BlocProvider.of<ProductPageCubit>(context)
                            .updateProduct(product, name, price, desc, image);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
