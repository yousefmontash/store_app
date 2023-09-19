import 'package:flutter/material.dart';
import 'package:strore_app/models/product_model.dart';
import 'package:strore_app/pages/update_product_page.dart';

class CustomCard extends StatelessWidget {
  ProductModel product;
  CustomCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 10,
            shadowColor: Colors.grey.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product.title.substring(0, 6)}",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$" "${product.price}",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -70,
            child: Image.network(
              product.image,
              height: 110,
              width: 110,
            ),
          ),
        ],
      ),
    );
  }
}
