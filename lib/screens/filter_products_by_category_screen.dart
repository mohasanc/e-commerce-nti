import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products/widgets/custom_products_gridView.dart';

class FilterProductsByCategory extends StatefulWidget {
  const FilterProductsByCategory({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<FilterProductsByCategory> createState() =>
      FilterProductsByCategoryState();
}

class FilterProductsByCategoryState extends State<FilterProductsByCategory> {
  Dio dio = Dio();
  List products = [];

  @override
  void initState() {
    log(widget.categoryName);
    filterProductsByCategory();
    super.initState();
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
      body: FutureBuilder(
        future: filterProductsByCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isEmpty
                ? Center(
                    child: Text(
                      'No Products Found',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ProductsGridview(products: products),
                  );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Future<List<dynamic>> filterProductsByCategory() async {
    Response response = await dio.get(
      'https://dummyjson.com/products/category/${widget.categoryName}',
    );
    setState(() {
      Map<String, dynamic> data = response.data;
      products = data["products"];
    });
    log('products: $products');

    return products;
  }
}
