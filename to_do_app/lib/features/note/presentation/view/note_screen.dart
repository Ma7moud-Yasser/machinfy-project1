import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/components/custom_snackBar.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';
import 'package:to_do_app/features/note/presentation/component/add_note_bottom.dart';
import 'package:to_do_app/features/note/presentation/component/custom_search_bar.dart';
import 'package:to_do_app/features/note/presentation/component/notes_list_view.dart';
import 'package:to_do_app/features/note/presentation/controller/notes_cubit/notes_cubit.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});
  static const route = '/noteScreen';

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..fetchAllNotes(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          if (state is NotesError) {
            customSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          final notesCubit = BlocProvider.of<NotesCubit>(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.03,
                vertical: MediaQuery.sizeOf(context).height * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.08,
                      bottom: MediaQuery.sizeOf(context).height * 0.03,
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
                  CustomSearchBar(
                    onChanged: (query) {
                      notesCubit.searchNotes(query);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.04,
                  ),
                  Expanded(
                    child: NotesListView(),
                  ),
                ],
              ),
            ),
            floatingActionButton: AddNoteBottomSheet(),
          );
        },
      ),
    );
  }
}
