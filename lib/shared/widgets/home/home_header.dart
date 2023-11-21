import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBlue,
      height: 100,
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
