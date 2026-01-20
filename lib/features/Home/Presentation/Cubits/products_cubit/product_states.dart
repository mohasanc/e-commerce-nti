import 'package:products/features/add_product/data/models/products.dart';

abstract class ProductStates {}

class ProductsInitial extends ProductStates {}

class ProductsLoading extends ProductStates {}
class ProductsFailure extends ProductStates {
  final String errorMessage;

  ProductsFailure({required this.errorMessage});
}

class ProductsSuccess extends ProductStates {
  final List<Product> products;

  ProductsSuccess({required this.products});
}

class DeleteProductLoading extends ProductStates {}

class DeleteProductSuccess extends ProductStates {}

class DeleteProductFailure extends ProductStates {}