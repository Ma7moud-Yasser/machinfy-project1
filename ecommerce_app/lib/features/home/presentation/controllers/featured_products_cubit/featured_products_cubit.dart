import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/services/dio_helper.dart';
import 'package:ecommerce_app/core/services/end_point.dart';
import 'package:ecommerce_app/features/home/models/featured_products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'featured_products_state.dart';

class FeaturedProductsCubit extends Cubit<FeaturedProductsState> {
  FeaturedProductsCubit() : super(FeaturedProductsInitial());
  FeaturedProductsCubit get(context) => BlocProvider.of(context);
  void getFeaturedProducts() {
    emit(FeaturedProductsLoadingState());
    DioHelper.getData(url: EndPoint.featuredProducts)
        .then((value) {
          FeaturedProductsModel featuredProducts =
              FeaturedProductsModel.fromJson(value!.data);
          if (featuredProducts.status!) {
            emit(FeaturedProductsSuccessState(featuredProducts));
          }
        })
        .catchError((e) {
          emit(FeaturedProductsErrorState(e.toString()));
        });
  }
}
