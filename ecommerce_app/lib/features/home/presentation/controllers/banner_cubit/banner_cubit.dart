import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/services/dio_helper.dart';
import 'package:ecommerce_app/core/services/end_point.dart';
import 'package:ecommerce_app/features/home/models/banner_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());
  static BannerCubit get(context) => BlocProvider.of(context);

  BannerModel? banner;
  void getBanner() {
    emit(BannerLoadingState());
    DioHelper.getData(url: EndPoint.banners)
        .then((value) {
          banner = BannerModel.fromJson(value!.data);
          emit(BannerSuccessState(bannerModel: banner!));
        })
        .catchError((e) {
          log(e.toString());
          emit(BannerErrorState(e.toString()));
        });
  }
}
