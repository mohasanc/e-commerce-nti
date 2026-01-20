abstract class AddProductStates {}

class AddProductInitial extends AddProductStates {}

class AddProductLoading extends AddProductStates {}

class AddProductSuccess extends AddProductStates {
  final String message;
  AddProductSuccess({required this.message});
}

class AddProductFailure extends AddProductStates {
  final String error;
  AddProductFailure({required this.error});
}
