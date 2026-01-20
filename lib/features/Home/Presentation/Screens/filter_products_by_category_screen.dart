import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/home/Presentation/Widgets/custom_products_gridView.dart';
import 'package:products/features/home/presentation/Cubits/filter_products_cubit/filter_products_cubit.dart';
import 'package:products/features/home/presentation/Cubits/filter_products_cubit/filter_products_states.dart';

class FilterProductsByCategory extends StatefulWidget {
  const FilterProductsByCategory({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<FilterProductsByCategory> createState() =>
      FilterProductsByCategoryState();
}

class FilterProductsByCategoryState extends State<FilterProductsByCategory> {
  late FilterProductsCubit filterProductsCubit;

  @override
  void initState() {
    filterProductsCubit = FilterProductsCubit();
    filterProductsCubit.getProductsByCategory(widget.categoryName);
    super.initState();
  }

  @override
  void dispose() {
    filterProductsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<FilterProductsCubit, FilterProductsStates>(
        bloc: filterProductsCubit,
        builder: (context, state) {
          if (state is FilterProductsSuccess) {
            return state.products.isEmpty
                ? Center(
                    child: Text(
                      'No Products Found',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ProductsGridview(products: state.products),
                  );
          } else if (state is FilterProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FilterProductsFailure) {
            return Center(
              child: Text(
                'Failed to load products',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
