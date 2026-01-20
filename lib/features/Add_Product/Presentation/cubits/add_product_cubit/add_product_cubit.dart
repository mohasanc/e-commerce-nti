import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/add_product/data/models/products.dart';
import 'package:products/features/home/data/datasources/remote_data_source.dart';
import 'add_product_states.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductInitial());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> addProduct({
    required String name,
    required String image,
    required double price,
    String? description,
    String? category,
  }) async {
    emit(AddProductLoading());
    try {
      Product newProduct = Product(
        name: name,
        image: image,
        price: price,
        describtion: description,
        category: category,
      );

      await remoteDataSource.addProduct(newProduct);

      emit(AddProductSuccess(message: 'Product added successfully'));
    } catch (e) {
      emit(AddProductFailure(error: e.toString()));
    }
  }
}
