import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rickandmorty/shared/constant/colors.dart';

import 'animated_image.dart';
import 'slider_dots.dart';

class CustomImageSlider extends StatefulWidget {
  final List<String> imagesUrl;
  const CustomImageSlider({super.key, required this.imagesUrl});

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  int currentIndex = 1;
  Timer? timer;
  PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      currentIndex = ++currentIndex % (widget.imagesUrl.length);
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBlue,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 270,
            child: PageView.builder(
              itemCount: widget.imagesUrl.length,
              pageSnapping: true,
              controller: pageController,
              onPageChanged: (activeIndex) {
                setState(() {
                  currentIndex = activeIndex;
                });
              },
              itemBuilder: (_, index) {
                bool active = currentIndex == index;
                return AnimatedImage(
                  active: active,
                  imageUrl: widget.imagesUrl[index],
                );
              },
            ),
          ),
          SliderDots(
            length: widget.imagesUrl.length,
            currentIndex: currentIndex,
          ),
        ],
      ),
    );
  }
}
