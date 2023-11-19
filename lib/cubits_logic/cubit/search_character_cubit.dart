import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/character_model.dart';
part 'search_character_state.dart';

class SearchCharacterCubit extends Cubit<SearchCharacterState> {
  List<CharacterModel> searchedResults = [];
  SearchCharacterCubit() : super(SearchCharacterInitial());

  List<CharacterModel> startSearching(
      String searching, List<CharacterModel> allCharacters) {
    for (var character in allCharacters) {
      if (character.name.toLowerCase().indexOf(searching.toLowerCase()) == 0) {
        searchedResults.add(character);
      }
    }

    if (searching.isNotEmpty) {
      if (searchedResults.isEmpty) {
        searchedResults = [];
        emit(NoReasultFound());
      } else {
        emit(SearchCharacterActive(searchedResults));
        searchedResults = [];
      }
    } else {
      searchedResults = [];
      emit(SearchCharacterNotActive());
    }

    return searchedResults;
  }

  searchCharacterNotActive(TextEditingController controller) {
    controller.clear();
    searchedResults = [];
    emit(SearchCharacterNotActive());
  }
}
