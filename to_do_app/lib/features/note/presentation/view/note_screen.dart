import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';
import 'package:to_do_app/features/note/presentation/component/add_note_bottom.dart';
import 'package:to_do_app/features/note/presentation/component/custom_search_bar.dart';
import 'package:to_do_app/features/note/presentation/component/note_card.dart';
import '../controller/add_note_cubit/add_note_cubit.dart';

class NoteScreen extends StatefulWidget {
  NoteScreen({super.key});
  static const route = '/noteScreen';

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final List<NoteModel> notes = [
    NoteModel(
      title: "First Note",
      description: "their is note their is note their is note",
      date: "10/1/2025",
    ),
    NoteModel(
      title: "Second Note",
      description: "their is note their is note their is note",
      date: "1/1/2025",
    ),
    NoteModel(
      title: "Third Note",
      description: "their is note their is note their is note",
      date: "12/12/2024",
    ),
    NoteModel(
      title: "Fourth Note",
      description: "their is note their is note their is note",
      date: "8/12/2024",
    ),
    NoteModel(
      title: "Fifth Note",
      description: "their is note their is note their is note",
      date: "1/12/2024",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        )
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: responsiveFont(
                        context,
                        fontSize: 40,
                      )),
                ),
              ),
              CustomSearchBar(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.04,
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.015,
                  ),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NotesCard(
                      title: notes[index].title,
                      description: notes[index].description,
                      date: notes[index].date,
                      onTap: () {
                        // cubit.removeNote(notes, index, context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AddNoteBottom(
          notes: notes,
        ),
      ),
    );
  }
}
