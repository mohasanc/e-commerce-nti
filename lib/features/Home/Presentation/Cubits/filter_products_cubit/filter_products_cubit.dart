import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/home/data/datasources/remote_data_source.dart';
import 'package:products/features/home/presentation/Cubits/filter_products_cubit/filter_products_states.dart';

class FilterProductsCubit extends Cubit<FilterProductsStates> {
  FilterProductsCubit() : super(FilterProductsInitial());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getProductsByCategory(String categoryName) async {
    emit(FilterProductsLoading());
    await remoteDataSource.getProductsByCategory(categoryName).then(
      (products) {
        emit(FilterProductsSuccess(products: products));
      },
      onError: (error) {
        emit(FilterProductsFailure());
      },
    );
  }
}
