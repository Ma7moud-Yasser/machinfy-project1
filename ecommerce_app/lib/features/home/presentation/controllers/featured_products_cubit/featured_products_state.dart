part of 'featured_products_cubit.dart';

@immutable
sealed class FeaturedProductsState {}

final class FeaturedProductsInitial extends FeaturedProductsState {}

final class FeaturedProductsLoadingState extends FeaturedProductsState {}

final class FeaturedProductsSuccessState extends FeaturedProductsState {
  final FeaturedProductsModel featuredProductsModel;
  FeaturedProductsSuccessState(this.featuredProductsModel);
}

final class FeaturedProductsErrorState extends FeaturedProductsState {
  final String error;
  FeaturedProductsErrorState(this.error);
}
