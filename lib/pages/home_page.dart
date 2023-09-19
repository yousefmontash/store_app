import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:strore_app/models/product_model.dart';
import 'package:strore_app/pages/cubits/products_cubit/products_cubit.dart';
import 'package:strore_app/services/get_all_products.dart';
import 'package:strore_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    List<ProductModel> productsList =
        BlocProvider.of<ProductsCubit>(context).productsList;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "New Trend",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsSuccess) {
              return Padding(
                padding: const EdgeInsets.only(right: 16, top: 75, left: 16),
                child: GridView.builder(
                  itemCount: productsList.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 100,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: productsList[index],
                    );
                  },
                ),
              );
            } else if (state is ProductsFailed) {
              return Center(
                child: Text("Something went wrong"),
              );
            } else {
              BlocProvider.of<ProductsCubit>(context).getAllProducts();
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
