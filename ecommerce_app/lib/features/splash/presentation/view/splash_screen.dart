import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/splash_screen_cubit.dart';
import '../controller/splash_screen_states.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit(),
      child: BlocConsumer<SplashScreenCubit, SplashScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SplashScreenCubit.get(context);
          return Scaffold();
        },
      ),
    );
  }
}
