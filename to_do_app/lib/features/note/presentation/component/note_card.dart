import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/styles/assets_manager.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({
    super.key,
    required this.note,
    required this.onTap,
  });

  final NoteModel note;
  final void Function()? onTap;

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

  void _startAnimation() async {
    await _animationController.forward();
    _animationController.reset();
    if (widget.onTap != null) widget.onTap!();
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
              onTap: _startAnimation,
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
