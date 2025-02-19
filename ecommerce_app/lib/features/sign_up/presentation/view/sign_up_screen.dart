import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/sign_up_screen_cubit.dart';
import '../controller/sign_up_screen_states.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpScreenCubit(),
      child: BlocConsumer<SignUpScreenCubit, SignUpScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SignUpScreenCubit.get(context);
          return Scaffold();
        },
      ),
    );
  }
}
