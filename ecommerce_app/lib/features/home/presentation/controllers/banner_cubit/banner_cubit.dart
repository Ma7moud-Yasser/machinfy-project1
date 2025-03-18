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

  void getBanner() {
    emit(BannerLoadingState());
    DioHelper.getData(url: EndPoint.banners).then((value) {
      BannerModel banner = BannerModel.fromJson(value!.data);
      if (banner.status == false || banner.data.isEmpty) {
        log("Error: No banner data available!");
        emit(BannerErrorState("لا توجد بيانات متاحة"));
        return;
      }
      log(banner.toString());
      emit(BannerSuccessState(bannerModel: banner));
    });
  }
}
