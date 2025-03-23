abstract class CartScreenStates {}

class CartScreenInitState extends CartScreenStates {}

class CartScreenLoadingState extends CartScreenStates {}

class CartScreenSuccessState extends CartScreenStates {}

class CartScreenErrorState extends CartScreenStates {
  final String message;
  CartScreenErrorState(this.message);
}
