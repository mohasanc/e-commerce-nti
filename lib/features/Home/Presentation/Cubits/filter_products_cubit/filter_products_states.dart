import 'package:products/features/add_product/data/models/products.dart';

abstract class FilterProductsStates {}

class FilterProductsInitial extends FilterProductsStates {}

class FilterProductsLoading extends FilterProductsStates {}

class FilterProductsFailure extends FilterProductsStates {}

class FilterProductsSuccess extends FilterProductsStates {
  final List<Product> products;

  FilterProductsSuccess({required this.products});
}
