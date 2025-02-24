import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/o_t_p_screen_cubit.dart';
import '../controller/o_t_p_screen_states.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OTPScreenCubit(),
      child: BlocConsumer<OTPScreenCubit, OTPScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OTPScreenCubit.get(context);
          return Scaffold();
        },
      ),
    );
  }
}
