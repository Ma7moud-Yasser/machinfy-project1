part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeSuccessState extends HomeState {}

final class HomeErrorState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeBottomNavIndexState extends HomeState {
  final int index;

  HomeBottomNavIndexState(this.index);
}
