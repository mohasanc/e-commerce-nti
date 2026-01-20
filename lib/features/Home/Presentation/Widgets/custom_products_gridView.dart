import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:products/features/add_product/data/models/products.dart';
import 'package:products/features/home/Presentation/Widgets/custom_product_items.dart';
import 'package:products/features/home/presentation/Cubits/products_cubit/product_states.dart';
import 'package:products/features/home/presentation/Cubits/products_cubit/products_cubit.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ProductsCubit(),
      child: BlocListener<ProductsCubit, ProductStates>(
        listener: (context, state) {
          if (state is DeleteProductLoading) {
            Fluttertoast.showToast(
              msg: "Deleting product...",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.orange,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else if (state is DeleteProductSuccess) {
            Fluttertoast.showToast(
              msg: "Product deleted successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            BlocProvider.of<ProductsCubit>(context).getAllProducts();
          } else if (state is DeleteProductFailure) {
            Fluttertoast.showToast(
              msg: "Error: ${'Failed to delete product'}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        child: GridView.builder(
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
        ),
      ),
    );
  }
}
