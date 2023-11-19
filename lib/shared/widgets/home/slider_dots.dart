import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class SliderDots extends StatelessWidget {
  final int length;
  final int currentIndex;
  const SliderDots({
    super.key, 
    required this.currentIndex, 
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 5,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (_, index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 10,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: currentIndex == index ? yellow : grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
