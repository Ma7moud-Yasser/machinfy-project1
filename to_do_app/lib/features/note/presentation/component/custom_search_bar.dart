import 'package:flutter/material.dart';
import 'package:to_do_app/features/note/presentation/component/custom_text_form_field.dart';

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
          child: CustomTextFormField(
            hintText: 'Search',
            maxLines: 1,
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
