import 'package:flutter/material.dart';
import 'package:to_do_app/core/components/custom_icon.dart';
import 'package:to_do_app/features/note/presentation/component/custom_text_form_field.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.onChanged,
  });
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: CustomTextFormField(
            onChanged: onChanged,
            hintText: 'Search',
            maxLines: 1,
          ),
        ),
        CustomIcon(
          onTap: () {},
          icon: Icons.content_paste_search_outlined,
        )
      ],
    );
  }
}
