abstract class CharacterByIdEvent {}

class GetCharacterById extends CharacterByIdEvent {
  final int id;

  GetCharacterById(this.id);

}

