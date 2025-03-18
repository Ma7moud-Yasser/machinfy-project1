part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesSuccessState extends CategoriesState {
  final CategoriesModel categoriesModel;
  CategoriesSuccessState(this.categoriesModel);
}

final class CategoriesLoadingState extends CategoriesState {}

final class CategoriesErrorState extends CategoriesState {
  final String error;

  CategoriesErrorState(this.error);
}
