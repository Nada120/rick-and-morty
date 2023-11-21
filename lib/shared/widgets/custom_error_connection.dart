import 'package:flutter/material.dart';
import '../constant/colors.dart';

class CustomErrorConnection extends StatelessWidget {
  const CustomErrorConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: 150,
            color: yellow,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'No WI-FI Connection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
