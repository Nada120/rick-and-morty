import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import '../../data/models/character_model.dart';
import '../../data/repository/character_repository.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  List<CharacterModel> characters = [];
  bool connection = false;
  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }

  bool checkConnection() {
    InternetConnectionChecker().hasConnection.then((isConnected) {
      if (!isConnected) {
        emit(CharactersErrorCase());
      } else {
        getAllCharacters();
      }
      connection = isConnected;
    });

    return connection;
  }
}
