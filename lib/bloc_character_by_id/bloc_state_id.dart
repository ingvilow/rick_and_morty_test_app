import 'package:rick_and_morty_test_app/models/character_id/character_by_id.dart';


abstract class CharacterByIdState {}

class CharacterByIdLoading extends CharacterByIdState {}

class CharacterByIdLoaded extends CharacterByIdState {
  final CharactersById sigleCharacterId;

  CharacterByIdLoaded(this.sigleCharacterId);
}

class CharacterByIdError extends CharacterByIdState {
  final String message;
  CharacterByIdError(this.message);
}