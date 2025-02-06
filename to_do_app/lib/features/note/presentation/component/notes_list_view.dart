import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/features/note/presentation/component/note_card.dart';
import 'package:to_do_app/features/note/presentation/controller/notes_cubit/notes_cubit.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return ListView.separated(
          reverse: true,
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) => SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NotesCard(
              note: notes[index],
              onTap: () {
                // BlocProvider.of<NotesCubit>(context).deleteNote(index);
              },
            );
          },
        );
      },
    );
  }
}
