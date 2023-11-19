import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/cubit/search_character_cubit.dart';
import '../../constant/colors.dart';
import '../../constant/images_slider.dart';
import '../grid_view_characters.dart';
import '../../../data/models/character_model.dart';
import 'custom_image_slider.dart';
import 'home_header.dart';

class HomePageBody extends StatelessWidget {
  final List<CharacterModel> characters;
  const HomePageBody({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocProvider(
            create: (context) => SearchCharacterCubit(),
            child: const HomeHeader(),
          ),
          CustomImageSlider(imagesUrl: imagesSlider),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 30),
            child: Text(
              'Characters',
              style: TextStyle(
                fontSize: 28,
                color: yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridViewCharacters(characters: characters),
        ],
      ),
    );
  }
}
