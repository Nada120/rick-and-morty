part of 'search_character_cubit.dart';

@immutable
sealed class SearchCharacterState {}

final class SearchCharacterInitial extends SearchCharacterState {}

final class SearchCharacterActive extends SearchCharacterState {
  final List<CharacterModel> characters;

  SearchCharacterActive(this.characters);
}

final class NoReasultFound extends SearchCharacterState {}

final class SearchCharacterNotActive extends SearchCharacterState {}
