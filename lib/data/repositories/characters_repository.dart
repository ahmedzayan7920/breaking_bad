import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<CharacterModel>> getAllCharacters() async {
    final charactersData = await charactersWebServices.getAllCharacters();
    return charactersData
        .map((character) => CharacterModel.fromJson(character))
        .toList();
  }
}
