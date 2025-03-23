import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/categories_screen_cubit.dart';
import '../controller/categories_screen_states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesScreenCubit(),
      child: BlocConsumer<CategoriesScreenCubit, CategoriesScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = CategoriesScreenCubit.get(context);
          return Scaffold();
        },
      ),
    );
  }
}
