import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/models/character_model.dart';
import '../../constant/colors.dart';

class DetailsPageBody extends StatelessWidget {
  final CharacterModel character;
  const DetailsPageBody({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              iconSize: 40,
              icon: const Icon(
                Icons.arrow_circle_left,
                color: yellow,
              ),
            ),
            Center(
              child: CachedNetworkImage(
                height: 300,
                width: 260,
                fit: BoxFit.fill,
                imageUrl: character.image,
                placeholder: (_, __) =>
                    Image.asset('assets/images/loading.gif'),
              ),
            ),
            const SizedBox(height: 35),
            Center(
              child: Text(
                character.name,
                style: const TextStyle(
                  color: yellow,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            detailsText('Status: ', character.status),
            detailsText('Gender: ', character.gender),
            detailsText('Origin: ', character.origin),
            detailsText('Species: ', character.species),
          ],
        ),
      ),
    );
  }

  Widget detailsText(String title, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: yellow,
            ),
          ),
          Text(
            data,
            style: const TextStyle(
              fontSize: 15,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
