import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/components/custom_icon.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';
import 'package:to_do_app/features/note/presentation/component/custom_text_form_field.dart';
import '../controller/edit_note_screen_cubit.dart';
import '../controller/edit_note_screen_states.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});
  static const String route = 'EditNoteScreen';
  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return BlocProvider(
      create: (context) => EditNoteScreenCubit(),
      child: BlocConsumer<EditNoteScreenCubit, EditNoteScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = EditNoteScreenCubit.get(context);
          return Scaffold(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Edit",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: responsiveFont(
                                  context,
                                  fontSize: 40,
                                )),
                      ),
                      CustomIcon(
                        icon: Icons.edit_calendar_rounded,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomTextFormField(hintText: note.title),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.04,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                            hintText: note.description, maxLines: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
