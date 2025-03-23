import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/setting_screen_cubit.dart';
import '../controller/setting_screen_states.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingScreenCubit(),
      child: BlocConsumer<SettingScreenCubit, SettingScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = SettingScreenCubit.get(context);
          return Scaffold();
        },
      ),
    );
  }
}
