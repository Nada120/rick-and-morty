import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBlue,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Rick&Morty',
            style: TextStyle(
              color: yellow,
              fontSize: 18,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
            color: yellow,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
