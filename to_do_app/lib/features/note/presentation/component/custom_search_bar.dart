import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: TextField(
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).width * 0.04)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.7,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).width * 0.04)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
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
              borderRadius: BorderRadius.circular(
                  MediaQuery.sizeOf(context).width * 0.04),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ),
            child: Icon(
              Icons.content_paste_search_outlined,
              color: Theme.of(context).colorScheme.secondary,
              size: MediaQuery.sizeOf(context).width * 0.09,
            ),
          ),
        )
      ],
    );
  }
}
