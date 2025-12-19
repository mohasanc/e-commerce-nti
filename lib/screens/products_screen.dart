import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products/screens/filter_products_by_category_screen.dart';
import 'package:products/widgets/custom_product_items.dart';
import 'package:products/widgets/custom_products_gridView.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<dynamic> products = [];
  List<dynamic> categories = [];
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    getAllProducts();
    getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Products",
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilterProductsByCategory(
                                categoryName: categories[index]['name'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff6055D8)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '${categories[index]['name']}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              flex: 7,
              child: FutureBuilder(
                future: getAllProducts(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return snapShot.data!.isEmpty
                        ? Text("No products found")
                        : ProductsGridview(products: products);
                  } else if (snapShot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapShot.hasError) {
                    return Center(child: Text('Error: ${snapShot.error}'));
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('https://dummyjson.com/products');

      setState(() {
        Map<String, dynamic> data = response.data;
        products = data['products'];
      });
      log(products.toString());
      return products;
    } catch (e) {
      log('Error: ${e.toString()}');
      return [];
    }
  }

  Future<void> getAllCategories() async {
    try {
      Response response = await dio.get(
        'https://dummyjson.com/products/categories',
      );
      setState(() {
        categories = response.data;
      });
    } catch (e) {
      log('Error: ${e.toString()}');
    }
  }
}
