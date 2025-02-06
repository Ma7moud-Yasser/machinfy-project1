import 'package:flutter/material.dart';
import 'package:to_do_app/core/components/custom_icon.dart';
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
        CustomIcon(
          icon: Icons.content_paste_search_outlined,
        )
      ],
    );
  }
}
