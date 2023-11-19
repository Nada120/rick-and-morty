import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import 'custom_text_form_field.dart';

class SearchHeader extends StatelessWidget {
  final TextEditingController controller;
  final void Function() cancel;
  final Function(String) onChanged;

  const SearchHeader({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              colors: [
                yellow,
                yellow.withOpacity(0.5),
              ],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
        ),
        CustomTextFormField(
          onChanged: onChanged,
          controller: controller,
          cancel: cancel,
        ),
        Positioned(
          bottom: 85,
          left: 5,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 40,
            icon: const Icon(
              Icons.arrow_circle_left,
              color: darkBlue,
            ),
          ),
        ),
      ],
    );
  }
}
