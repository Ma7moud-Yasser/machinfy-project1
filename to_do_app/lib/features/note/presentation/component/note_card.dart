import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/styles/assets_manager.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String title;
  final String description;
  final void Function()? onTap;

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
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
        subtitle: Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.6),
              ),
        ),
        trailing: GestureDetector(
          onTap: onTap,
          child: Lottie.asset(
            IconsAssets.trash,
            width: MediaQuery.sizeOf(context).width * 0.15,
            height: MediaQuery.sizeOf(context).height * 0.15,
          ),
        ),
      ),
    );
  }
}
