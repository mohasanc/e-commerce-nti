  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/home/data/datasources/remote_data_source.dart';
import 'package:products/features/home/presentation/Cubits/categories_cubit/categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitial());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    await remoteDataSource.getAllCategories().then(
      (categories) {
        emit(CategoriesSuccess(categories: categories));
      },
      onError: (error) {
        emit(CategoriesFailure());
      },
    );
  }
}