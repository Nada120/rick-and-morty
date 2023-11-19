import 'package:flutter/material.dart';
import '../../data/models/character_model.dart';
import '../../shared/widgets/character_item.dart';

class GridViewCharacters extends StatelessWidget {
  final List<CharacterModel> characters;
  const GridViewCharacters({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
        ),
        itemCount: characters.length,
        itemBuilder: (_, index) => CharacterItem(
          character: characters[index],
        ),
      ),
    );
  }
}
