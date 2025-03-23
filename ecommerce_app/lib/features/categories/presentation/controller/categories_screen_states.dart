abstract class CategoriesScreenStates {}

class CategoriesScreenInitState extends CategoriesScreenStates {}

class CategoriesScreenLoadingState extends CategoriesScreenStates {}

class CategoriesScreenSuccessState extends CategoriesScreenStates {}

class CategoriesScreenErrorState extends CategoriesScreenStates {
  final String message;
  CategoriesScreenErrorState(this.message);
}
