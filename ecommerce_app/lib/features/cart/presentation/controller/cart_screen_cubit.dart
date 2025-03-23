import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_screen_states.dart';

class CartScreenCubit extends Cubit<CartScreenStates> {
  CartScreenCubit() : super(CartScreenInitState());

  static CartScreenCubit get(context) => BlocProvider.of(context);

  void getCart() {}
}
