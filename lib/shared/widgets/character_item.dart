import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/shared/constant/colors.dart';
import '../../data/models/character_model.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: character);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: character.image,
              placeholder: (_, __) => Image.asset('assets/images/loading.gif'),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: yellow.withOpacity(0.8),
              ),
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
