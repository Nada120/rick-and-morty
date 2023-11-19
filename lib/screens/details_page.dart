import 'package:flutter/material.dart';
import '../data/models/character_model.dart';
import '../shared/widgets/details/details_page_body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as CharacterModel;
    return DetailsPageBody(character: character);
  }
}
