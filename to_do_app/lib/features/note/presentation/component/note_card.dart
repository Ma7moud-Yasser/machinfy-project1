import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/styles/assets_manager.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';
import 'package:to_do_app/features/note/presentation/controller/notes_cubit/notes_cubit.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimationAndDeleteNote() async {
    await _animationController.forward();
    _animationController.reset();
    widget.note.delete();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * .01,
        vertical: MediaQuery.sizeOf(context).height * .01,
      ),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(MediaQuery.sizeOf(context).height * 0.02),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              widget.note.title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            subtitle: Text(
              widget.note.description,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.6),
                  ),
            ),
            trailing: GestureDetector(
              onTap: () {
                _startAnimationAndDeleteNote();
              },
              child: Lottie.asset(
                IconsAssets.trash,
                width: MediaQuery.sizeOf(context).width * 0.15,
                height: MediaQuery.sizeOf(context).height * 0.15,
                controller: _animationController,
                onLoaded: (composition) {
                  _animationController.duration = composition.duration;
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.035),
            child: Text(
              widget.note.date,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: responsiveFont(
                    context,
                    fontSize: 16,
                  ),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
