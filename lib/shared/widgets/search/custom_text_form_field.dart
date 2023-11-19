import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final void Function() cancel;
  final Function(String) onChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: yellow,
        decoration: InputDecoration(
          border: customBorder(),
          enabledBorder: customBorder(),
          errorBorder: customBorder(),
          focusedBorder: customBorder(),
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          hintText: 'Find A Character',
          suffixIcon: IconButton(
            onPressed: cancel,
            icon: const Icon(
              Icons.cancel_rounded,
              color: yellow,
            ),
          ),
        ),
      ),
    );
  }

  UnderlineInputBorder customBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: yellow,
      ),
    );
  }
}
