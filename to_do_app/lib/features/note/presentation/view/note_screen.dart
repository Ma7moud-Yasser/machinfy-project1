import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';
import 'package:to_do_app/features/note/presentation/component/custom_search_bar.dart';
import 'package:to_do_app/features/note/presentation/component/custom_text_form_field.dart';
import 'package:to_do_app/features/note/presentation/component/note_card.dart';
import '../controller/add_note_cubit/add_note_cubit.dart';
import '../controller/add_note_cubit/add_note_states.dart';

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
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is AddNoteErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final cubit = AddNoteCubit.get(context);
          return Scaffold(
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
                            cubit.removeNote(notes, index, context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.1,
                        right: MediaQuery.sizeOf(context).width * 0.1,
                        top: MediaQuery.sizeOf(context).height * 0.03,
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            spacing: 15,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.sizeOf(context).width * 0.02,
                                ),
                                child: Text(
                                  "Add New Task",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ),
                              CustomTextFormField(
                                hintText: "Note Title",
                                controller: cubit.noteTitleController,
                                maxLines: 1,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please fill in the title";
                                  }
                                  return null;
                                },
                              ),
                              CustomTextFormField(
                                hintText: "Description",
                                controller: cubit.noteDescription,
                                maxLines: 5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please fill in the description";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        MediaQuery.sizeOf(context).width * 0.04,
                                      ),
                                    ),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.sizeOf(context).width *
                                              0.1,
                                      vertical:
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
                                    ),
                                  ),
                                  onPressed: () {
                                    cubit.addNote(notes, context);
                                  },
                                  child: Text(
                                    "Add Note",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(
                Icons.add,
                size: MediaQuery.sizeOf(context).width * 0.08,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        },
      ),
    );
  }
}
