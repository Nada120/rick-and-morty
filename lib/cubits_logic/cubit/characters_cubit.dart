import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/character_model.dart';
import '../../data/repository/character_repository.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  List<CharacterModel> characters = [];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
