import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/welcome_screen_cubit.dart';
import '../controller/welcome_screen_states.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeScreenCubit(),
      child: BlocConsumer<WelcomeScreenCubit, WelcomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = WelcomeScreenCubit.get(context);
          return Scaffold(
            
          );
        },
      ),
    );
  }
}
