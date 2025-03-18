import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/services/dio_helper.dart';
import 'package:ecommerce_app/core/services/end_point.dart';
import 'package:ecommerce_app/features/home/models/categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  void getCategories() {
    emit(CategoriesLoadingState());
    DioHelper.getData(url: EndPoint.categories)
        .then((value) {
          CategoriesModel categories = CategoriesModel.fromJson(value!.data);
          if (categories.status) {
            emit(CategoriesSuccessState(categories));
          }
        })
        .catchError((e) {
          emit(CategoriesErrorState(e.toString()));
        });
  }
}
