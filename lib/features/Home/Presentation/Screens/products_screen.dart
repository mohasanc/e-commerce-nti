import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/home/Presentation/Widgets/categories_widget.dart';
import 'package:products/features/home/Presentation/Widgets/custom_products_gridView.dart';
import 'package:products/features/home/presentation/Cubits/categories_cubit/categories_cubit.dart';
import 'package:products/features/home/presentation/Cubits/categories_cubit/categories_states.dart';
import 'package:products/features/home/presentation/Cubits/products_cubit/product_states.dart';
import 'package:products/features/home/presentation/Cubits/products_cubit/products_cubit.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getAllProducts();
    BlocProvider.of<CategoriesCubit>(context).getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(
          "Products & Categories",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            BlocBuilder<CategoriesCubit, CategoriesStates>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CategoriesSuccess) {
                  return CategoriesWidget(categories: state.categories);
                } else if (state is CategoriesFailure) {
                  return Center(child: Text('Failed to load categories'));
                }
                return SizedBox.shrink();
              },
            ),
            Row(
              children: [
                Text(
                  'Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              flex: 7,
              child: BlocBuilder<ProductsCubit, ProductStates>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductsSuccess) {
                    return ProductsGridview(products: state.products);
                  } else if (state is ProductsFailure) {
                    return Center(child: Text('Failed to load products'));
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
