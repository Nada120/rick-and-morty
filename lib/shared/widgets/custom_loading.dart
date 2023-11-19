import 'package:flutter/material.dart';
import 'package:rickandmorty/shared/constant/colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: yellow,
        strokeWidth: 6.0,
      ),
    );
  }
}