import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';
import 'package:to_do_app/features/note/presentation/component/custom_search_bar.dart';
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
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.06,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.1,
                      bottom: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    child: Text(
                      "Notes",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: responsiveFont(
                                context,
                                fontSize: 40,
                              )),
                    ),
                  ),
                  CustomSearchBar()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
