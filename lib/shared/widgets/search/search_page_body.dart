import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/cubits_logic/cubit/characters_cubit.dart';
import '../../../cubits_logic/cubit/search_character_cubit.dart';
import '../../../shared/constant/colors.dart';
import '../grid_view_characters.dart';
import 'search_header.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    final charactersCubit = BlocProvider.of<CharactersCubit>(context);
    return Scaffold(
      backgroundColor: darkBlue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchHeader(
              controller: searchController,
              onChanged: (searchedValue) {
                BlocProvider.of<SearchCharacterCubit>(context).startSearching(
                  searchController.text,
                  charactersCubit.characters,
                );
              },
              cancel: () {
                BlocProvider.of<SearchCharacterCubit>(context)
                    .searchCharacterNotActive(searchController);
              },
            ),
            BlocBuilder<SearchCharacterCubit, SearchCharacterState>(
              builder: (context, state) {
                if (state is SearchCharacterActive) {
                  return GridViewCharacters(characters: (state).characters);
                } else if (state is NoReasultFound) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Text(
                      'No Result Found',
                      style: TextStyle(
                        fontSize: 25,
                        color: grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Text(
                      'Start Searching',
                      style: TextStyle(
                        fontSize: 25,
                        color: grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
