import 'package:flutter/material.dart';
import 'package:products/features/Add_Product/Data/Models/products.dart';
import 'package:products/features/Home/Presentation/Widgets/custom_product_items.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CustomProductItems(product: products[index]);
      },
    );
  }
}
