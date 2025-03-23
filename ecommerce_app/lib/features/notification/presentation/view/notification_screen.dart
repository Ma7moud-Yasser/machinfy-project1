import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/notification_screen_cubit.dart';
import '../controller/notification_screen_states.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationScreenCubit(),
      child: BlocConsumer<NotificationScreenCubit, NotificationScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = NotificationScreenCubit.get(context);
          return Scaffold();
        },
      ),
    );
  }
}
