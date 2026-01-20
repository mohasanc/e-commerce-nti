import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/add_product/data/models/products.dart';
import 'package:products/features/home/data/datasources/remote_data_source.dart';
import 'package:products/features/home/presentation/Cubits/products_cubit/product_states.dart';

class ProductsCubit extends Cubit<ProductStates> {
  ProductsCubit() : super(ProductsInitial());
  RemoteDataSource remoteDataSource = RemoteDataSource();
  List<Product> products = [];
  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    await remoteDataSource.getAllProducts().then(
      (value) {
        log("Value in cubit: $value");
        products = value;
        emit(ProductsSuccess(products: value));
      },
      onError: (error) {
        log("Error in cubit $error");
        emit(ProductsFailure(errorMessage: error.toString()));
      },
    );
  }

  

  Future<void> deleteProduct({required int id}) async {
    emit(DeleteProductLoading());
    await remoteDataSource
        .deleteProduct(id: id)
        .then(
          (value) {
            products.removeWhere((element) => element.id == id);
            emit(DeleteProductSuccess());
            emit(ProductsSuccess(products: products));
          },
          onError: (error) {
            emit(DeleteProductFailure());
          },
        );
  }
}



// state
// cubit
// funcation
// bloc provider
// bloc builder
// triggier