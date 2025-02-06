import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.03),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius:
              BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.04),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary,
          size: icon == Icons.content_paste_search_outlined
              ? MediaQuery.sizeOf(context).width * 0.09
              : MediaQuery.sizeOf(context).width * 0.07,
        ),
      ),
    );
  }
}
