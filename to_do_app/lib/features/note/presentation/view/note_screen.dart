import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/note_screen_cubit.dart';
import '../controller/note_screen_states.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});
  static const route = '/noteScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteScreenCubit(),
      child: BlocConsumer<NoteScreenCubit, NoteScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = NoteScreenCubit.get(context);
          return Scaffold();
        },
      ),
    );
  }
}
