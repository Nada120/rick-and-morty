import 'package:flutter/material.dart';

class AnimatedImage extends StatelessWidget {
  final bool active;
  final String imageUrl;

  const AnimatedImage({
    super.key,
    required this.active,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: active ? 10 : 40,
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
