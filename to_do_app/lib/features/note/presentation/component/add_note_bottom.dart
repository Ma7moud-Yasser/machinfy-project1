import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/components/custom_snackBar.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/features/note/presentation/component/custom_text_form_field.dart';
import 'package:to_do_app/features/note/presentation/controller/add_note_cubit/add_note_cubit.dart';
import 'package:to_do_app/features/note/presentation/controller/add_note_cubit/add_note_states.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
    required this.notes,
  });
  final List<NoteModel> notes;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is AddNoteSuccessState) {
            customSnackBar(context, message: 'Note added successfully!');
            Navigator.pop(context);
          } else if (state is AddNoteErrorState) {
            customSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          final addNoteCubit = AddNoteCubit.get(context);
          return FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return AbsorbPointer(
                    absorbing: state is AddNoteLoadingState,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.051,
                        right: MediaQuery.sizeOf(context).width * 0.051,
                        top: MediaQuery.sizeOf(context).height * 0.02,
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Form(
                          key: addNoteCubit.formKey,
                          child: Column(
                            spacing: 15,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.sizeOf(context).width * 0.01,
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
                                controller: addNoteCubit.noteTitleController,
                                maxLines: 1,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Please fill in the title";
                                  }
                                  return null;
                                },
                              ),
                              CustomTextFormField(
                                hintText: "Description",
                                controller: addNoteCubit.noteDescription,
                                maxLines: 5,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
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
                                    addNoteCubit.addNotes(
                                      NoteModel(
                                        title: addNoteCubit
                                            .noteTitleController.text,
                                        description:
                                            addNoteCubit.noteDescription.text,
                                        date: DateTime.now().toString(),
                                      ),
                                    );
                                  },
                                  child: state is AddNoteLoadingState
                                      ? CircularProgressIndicator.adaptive(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                        )
                                      : Text(
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
          );
        },
      ),
    );
  }
}
