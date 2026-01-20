import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:products/features/add_product/data/models/products.dart';

class RemoteDataSource {
  final Dio dio = Dio();

  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    try {
      Response response = await dio.get('https://dummyjson.com/products');
      Map<String, dynamic> data = response.data;
      for (var element in data['products']) {
        Product product = Product.fromJsonToProduct(element);
        products.add(product);
      }
      log(products.toString());
      return products;
    } catch (e) {
      log('Error: ${e.toString()}');
      return [];
    }
  }

  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories = [];
    try {
      Response response = await dio.get(
        'https://dummyjson.com/products/categories',
      );
      categories = response.data;
    } catch (e) {
      log('Error: ${e.toString()}');
    }
    return categories;
  }

  Future<List<Product>> getProductsByCategory(String categoryName) async {
    List<Product> products = [];
    try {
      Response response = await dio.get(
        'https://dummyjson.com/products/category/$categoryName',
      );
      Map<String, dynamic> data = response.data;
      for (var element in data['products']) {
        Product product = Product.fromJsonToProduct(element);
        products.add(product);
      }
      log(products.toString());
      return products;
    } catch (e) {
      log('Error: ${e.toString()}');
      return [];
    }
  }

  Future<void> deleteProduct({required int id}) async {
    try {
      Response response = await dio.delete(
        'https://dummyjson.com/products/$id',
      );
      log('Product deleted: ${response.data}');
    } catch (e) {
      log('Error deleting product: ${e.toString()}');
      rethrow;
    }
  }

  Future<Product> addProduct(Product product) async {
    try {
      Response response = await dio.post(
        'https://dummyjson.com/products/add',
        data: {
          'title': product.name,
          'thumbnail': product.image,
          'price': product.price,
          'description': product.describtion,
          'category': product.category,
        },
      );
      log('Product added: ${response.data}');
      Product addedProduct = Product.fromJsonToProduct(response.data);
      return addedProduct;
    } catch (e) {
      log('Error adding product: ${e.toString()}');
      rethrow;
    }
  }
}
