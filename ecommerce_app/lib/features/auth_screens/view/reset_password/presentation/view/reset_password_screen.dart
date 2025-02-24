import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/reset_password_screen_cubit.dart';
import '../controller/reset_password_screen_states.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordScreenCubit(),
      child: BlocConsumer<ResetPasswordScreenCubit, ResetPasswordScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ResetPasswordScreenCubit.get(context);
          return Scaffold();
        },
      ),
    );
  }
}
