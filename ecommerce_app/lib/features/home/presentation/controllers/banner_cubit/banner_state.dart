part of 'banner_cubit.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}

final class BannerLoadingState extends BannerState {}

final class BannerSuccessState extends BannerState {
  final BannerModel bannerModel;

  BannerSuccessState({required this.bannerModel});
}

final class BannerErrorState extends BannerState {
  final String error;
  BannerErrorState(this.error);
}
