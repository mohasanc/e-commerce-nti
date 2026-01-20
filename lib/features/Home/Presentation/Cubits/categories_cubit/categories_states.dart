abstract class CategoriesStates {}

class CategoriesInitial extends CategoriesStates {}

class CategoriesLoading extends CategoriesStates {}
class CategoriesFailure extends CategoriesStates {}

class CategoriesSuccess extends CategoriesStates {
  List<dynamic> categories;
  CategoriesSuccess({required this.categories});
}