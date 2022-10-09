import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/data/repositories/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late List<CharacterModel> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
