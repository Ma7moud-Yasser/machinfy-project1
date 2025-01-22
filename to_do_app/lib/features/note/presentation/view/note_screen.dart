import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';
import 'package:to_do_app/features/note/presentation/component/custom_search_bar.dart';
import 'package:to_do_app/features/note/presentation/component/note_card.dart';
import '../controller/note_screen_cubit.dart';
import '../controller/note_screen_states.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({super.key});
  static const route = '/noteScreen';

  final List<NoteModel> notes = [
    NoteModel(
      title: "First Note",
      description: "their is note their is note their is note",
      date: "12/12/2021",
    ),
    NoteModel(
      title: "Second Note",
      description: "their is note their is note their is note",
      date: "12/12/2021",
    ),
    NoteModel(
      title: "Third Note",
      description: "their is note their is note their is note",
      date: "12/12/2021",
    ),
    NoteModel(
      title: "Fourth Note",
      description: "their is note their is note their is note",
      date: "12/12/2021",
    ),
    NoteModel(
      title: "Fifth Note",
      description: "their is note their is note their is note",
      date: "12/12/2021",
    ),
  ];

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
                  CustomSearchBar(),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.01,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return NotesCard(
                          title: notes[index].title,
                          description: notes[index].description,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
