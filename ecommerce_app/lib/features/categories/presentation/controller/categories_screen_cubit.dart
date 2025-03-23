import 'package:flutter_bloc/flutter_bloc.dart';
import 'categories_screen_states.dart';

class CategoriesScreenCubit extends Cubit<CategoriesScreenStates> {
  CategoriesScreenCubit() : super(CategoriesScreenInitState());

  static CategoriesScreenCubit get(context) => BlocProvider.of(context);
}
