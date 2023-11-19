import '../../data/models/character_model.dart';
import '../../data/services/character_services.dart';

class CharacterRepository {
  final CharacterServices characterServices;

  CharacterRepository(this.characterServices);

  Future<List<CharacterModel>> getAllCharacters() async {
    final characters = await characterServices.getAllCharacters();
    return characters.map((json) => CharacterModel.fromJSON(json)).toList();
  }
}
